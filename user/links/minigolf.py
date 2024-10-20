
# Imports
from python_datapack.utils.io import *
START_COORDS = "132 61 -121 90 0"
RANKING_SIZE: int = 25
DEFAULT_RANKING = [
	{"name": "Unknown", "score": 2024, "time": 0.0, "time_str": "0.0"},
] * RANKING_SIZE

# Main function to place the text displays
def main(config: dict) -> None:
	database: dict[str, dict] = config["database"]
	namespace: str = config["namespace"]

	# Make an item modifier that modifies the item custom_model_data to the database["none"]["custom_model_data"]
	item_modifier: dict = {"function": "minecraft:set_custom_model_data","value": database["none"]["custom_model_data"]}
	write_to_file(f"{config['build_datapack']}/data/{namespace}/item_modifier/minigolf_offhand.json", super_json_dump(item_modifier))

	# Make the start function (teleport, summon, and give the item)
	write_to_function(config, f"{namespace}:minigolf/start", f"""
# Teleport the player to the start of the minigolf course
tp @s {START_COORDS}

# Change default summon values
scoreboard players set #default_do_y_shots golf_ball.data 1
scoreboard players set #default_do_collision golf_ball.data 0

# Reset scores
scoreboard players set @s golf_ball.shots 0
scoreboard players set @s golf_ball.cooldown 0
scoreboard players operation @s {namespace}.minigolf_time = #total_ticks {namespace}.data

# Summon the golf ball
execute at @s run function golf_ball:summon

# Change the player's offhand item
item modify entity @s weapon.offhand {namespace}:minigolf_offhand
""")
	
	# Tick function (check when finished)
	write_to_tick_file(config, f"""
# Track the total number of ticks (used for timings)
scoreboard players add #total_ticks {namespace}.data 1

# Check if the player finished the minigolf course
execute if score #total_balls golf_ball.data matches 1.. as @e[tag=golf_ball.display,x=109,y=59,z=-130,dx=0,dy=0,dz=0] run function {namespace}:minigolf/finish
""")
	
	# Finish function
	write_to_function(config, f"{namespace}:minigolf/finish", f"""
# Setup database if not already done
execute unless data storage {namespace}:minigolf ranking run function {namespace}:minigolf/setup_database

# Register the score for the player
data modify storage {namespace}:minigolf input set value {{name:""}}
data modify storage {namespace}:minigolf input.name set from entity @s item.components."minecraft:profile".name
execute on vehicle on passengers if entity @s[type=player] run function {namespace}:minigolf/register_score with storage {namespace}:minigolf input

# Leave the minigolf course
execute on vehicle on passengers if entity @s[type=player] positioned 133 62 -121 run function golf_ball:ball/exit_player
""")
	
	# Setup database function
	write_to_function(config, f"{namespace}:minigolf/setup_database", f"""
# Create the database
data modify storage {namespace}:minigolf ranking set value {DEFAULT_RANKING}
""")
	
	# Register score function
	write_to_function(config, f"{namespace}:minigolf/register_score", f"""
# Grant booth stamp
advancement grant @s only smithed_passport:visit_booth/python_datapack

# If player is not in the database, add it
$execute unless data storage {namespace}:minigolf ranking[{{name:"$(name)"}}] run data modify storage {namespace}:minigolf ranking append value {{name:"$(name)",score:2024,time:0.0,time_str:"0.0"}}

# Update the minigolf time (subtract the time spent on the course => result in a negative value so we multiply by -1)
scoreboard players set #-1 {namespace}.data -1
scoreboard players operation @s {namespace}.minigolf_time -= #total_ticks {namespace}.data
scoreboard players operation @s {namespace}.minigolf_time *= #-1 {namespace}.data

# Check if the player got a better score
scoreboard players set #is_better_score {namespace}.data 0
$execute store result score #database_score {namespace}.data run data get storage {namespace}:minigolf ranking[{{name:"$(name)"}}].score
execute if score @s golf_ball.shots < #database_score {namespace}.data run scoreboard players set #is_better_score {namespace}.data 1
$execute if score @s golf_ball.shots = #database_score {namespace}.data store result score #database_time {namespace}.data run data get storage {namespace}:minigolf ranking[{{name:"$(name)"}}].time 20
execute if score @s golf_ball.shots = #database_score {namespace}.data if score @s {namespace}.minigolf_time < #database_time {namespace}.data run scoreboard players set #is_better_score {namespace}.data 1

# If not better, return
execute unless score #is_better_score {namespace}.data matches 1 run return fail

# Get the player's score and time in the database
$execute store result storage {namespace}:minigolf ranking[{{name:"$(name)"}}].score int 1 run scoreboard players get @s golf_ball.shots
$execute store result storage {namespace}:minigolf ranking[{{name:"$(name)"}}].time double 0.05 run scoreboard players get @s {namespace}.minigolf_time

# Insert time string in the database
$function {namespace}:minigolf/time_to_string with storage {namespace}:minigolf ranking[{{name:"$(name)"}}]

# Sort the database (if the player got a better score)
function {namespace}:minigolf/sort_database/main
""")
	
	# Time to string function
	write_to_function(config, f"{namespace}:minigolf/time_to_string", f"""
# Convert the time to a string
$data modify storage {namespace}:minigolf time_str set value "$(time)"

# If the time_str is like "11.950000000000001", change it to "11.95"
$execute if score @s {namespace}.minigolf_time matches 1..199 run data modify storage {namespace}:minigolf ranking[{{name:"$(name)"}}].time_str set string storage {namespace}:minigolf time_str 0 4
$execute if score @s {namespace}.minigolf_time matches 200..1999 run data modify storage {namespace}:minigolf ranking[{{name:"$(name)"}}].time_str set string storage {namespace}:minigolf time_str 0 5
$execute if score @s {namespace}.minigolf_time matches 2000..19999 run data modify storage {namespace}:minigolf ranking[{{name:"$(name)"}}].time_str set string storage {namespace}:minigolf time_str 0 6
$execute if score @s {namespace}.minigolf_time matches 20000..199999 run data modify storage {namespace}:minigolf ranking[{{name:"$(name)"}}].time_str set string storage {namespace}:minigolf time_str 0 7
""")

	# Sort database function
	write_to_function(config, f"{namespace}:minigolf/sort_database/main", f"""
# Copy the database
data modify storage {namespace}:minigolf ranking_copy set from storage {namespace}:minigolf ranking

# Sort the database
data modify storage {namespace}:minigolf sorted set value []
function {namespace}:minigolf/sort_database/while_loop

# Save the sorted database
data modify storage {namespace}:minigolf ranking set from storage {namespace}:minigolf sorted

# Display the database
function {namespace}:minigolf/display
""")
	
	# Sort database while loop function
	write_to_function(config, f"{namespace}:minigolf/sort_database/while_loop", f"""
# Get the lowest score index
scoreboard players set #index {namespace}.data 0
scoreboard players set #lowest_index {namespace}.data 0
scoreboard players set #lowest_score {namespace}.data 1024
scoreboard players set #lowest_time {namespace}.data 0
data modify storage {namespace}:minigolf copy set from storage {namespace}:minigolf ranking_copy

# Loop through the database
execute if data storage {namespace}:minigolf copy[0] run function {namespace}:minigolf/sort_database/get_lowest_index

# Add the lowest score to the sorted database
data modify storage {namespace}:minigolf sort_input set value {{index:0}}
execute store result storage {namespace}:minigolf sort_input.index int 1 run scoreboard players get #lowest_index {namespace}.data
function {namespace}:minigolf/sort_database/add_lowest_score_and_remove with storage {namespace}:minigolf sort_input

# Loop again if there are still scores in the database
execute if data storage {namespace}:minigolf ranking_copy[0] run function {namespace}:minigolf/sort_database/while_loop
""")
	
	# Get lowest index function
	write_to_function(config, f"{namespace}:minigolf/sort_database/get_lowest_index", f"""
# Extract the current score and time (positive time in ticks)
execute store result score #current_score {namespace}.data run data get storage {namespace}:minigolf copy[0].score
execute store result score #current_time {namespace}.data run data get storage {namespace}:minigolf copy[0].time 20

# Check if the current score is higher than the lowest score
scoreboard players set #is_current_better {namespace}.data 0
execute if score #current_score {namespace}.data < #lowest_score {namespace}.data run scoreboard players set #is_current_better {namespace}.data 1
execute if score #current_score {namespace}.data = #lowest_score {namespace}.data if score #current_time {namespace}.data < #lowest_time {namespace}.data run scoreboard players set #is_current_better {namespace}.data 1

# Update the lowest values if the current score is better
execute if score #is_current_better {namespace}.data matches 1 run scoreboard players operation #lowest_score {namespace}.data = #current_score {namespace}.data
execute if score #is_current_better {namespace}.data matches 1 run scoreboard players operation #lowest_time {namespace}.data = #current_time {namespace}.data
execute if score #is_current_better {namespace}.data matches 1 run scoreboard players operation #lowest_index {namespace}.data = #index {namespace}.data

# Remove the current score from the copy
data remove storage {namespace}:minigolf copy[0]
scoreboard players add #index {namespace}.data 1

# Loop again if there are still scores to compare in the copy
execute if data storage {namespace}:minigolf copy[0] run function {namespace}:minigolf/sort_database/get_lowest_index
""")
	
	# Add lowest score and remove function
	write_to_function(config, f"{namespace}:minigolf/sort_database/add_lowest_score_and_remove", f"""
# Add the lowest score to the sorted database
$data modify storage {namespace}:minigolf sorted append from storage {namespace}:minigolf ranking_copy[$(index)]

# Remove the lowest score from the ranking copy
$data remove storage {namespace}:minigolf ranking_copy[$(index)]
""")
	
	# Display function
	DISPLAY_TEXT: list[dict|list[dict]] = [
		{"text":"------------ [Minigolf Ranking] ------------\\n","color":"green"},
	]
	for i in range(RANKING_SIZE):
		rank: list[dict] = [{"text":"\\n","color":"gold"},{"text":f" #{i+1} " if i < 9 else f"#{i+1} "},{"nbt":f"ranking[{i}].name","storage":f"{namespace}:minigolf","color":"yellow"},{"text":" with "},{"nbt":f"ranking[{i}].score","storage":f"{namespace}:minigolf","color":"aqua"},{"text":" shots "},{"text":"(","color":"aqua"},{"nbt":f"ranking[{i}].time_str","storage":f"{namespace}:minigolf","color":"aqua"},{"text":"s","color":"aqua"},{"text":")","color":"aqua"}]
		DISPLAY_TEXT.append(rank)
	DISPLAY_TEXT = json.dumps(DISPLAY_TEXT)
	TRANSFORMATION: str = "{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.0f,0.1f,-0.45f],scale:[0.4f,0.4f,0.4f]}"
	write_to_function(config, f"{namespace}:minigolf/display", f"""
# Setup database if not already done
execute unless data storage {namespace}:minigolf ranking run function {namespace}:minigolf/setup_database

# Kill the previous display
kill @e[tag={namespace}.minigolf_display]

# Display the minigolf display
summon text_display 131 61 -122 {{billboard:"fixed",alignment:"left",line_width:350,transformation:{TRANSFORMATION},text:'{DISPLAY_TEXT}',Tags:["{namespace}.minigolf_display","{namespace}","smithed.entity","smithed.strict","global.ignore","global.ignore.strict"]}}
""")

	pass

