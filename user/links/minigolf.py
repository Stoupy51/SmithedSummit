
# Imports
from python_datapack.utils.io import *
START_COORDS = "132 61 -121 90 0"
DEFAULT_RANKING = [
	{"name": "---", "score": 2024},
] * 20

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

# Summon the golf ball
execute at @s run function golf_ball:summon

# Change the player's offhand item
item modify entity @s weapon.offhand {namespace}:minigolf_offhand
""")
	
	# Tick function (check when finished)
	write_to_tick_file(config, f"""
# Check if the player finished the minigolf course
execute if score #total_balls golf_ball.data matches 1.. as @e[tag=golf_ball.display,x=109,y=59,z=-130,dx=0,dy=0,dz=0] run function {namespace}:minigolf/finish
""")
	
	# Finish function
	write_to_function(config, f"{namespace}:minigolf/finish", f"""
# Setup database if not already done
execute unless data storage {namespace}:minigolf run function {namespace}:minigolf/setup_database

# Register the score for the player
data modify storage {namespace}:minigolf input set value {{name:""}}
data modify storage {namespace}:minigolf input.name set from entity @s item.components."minecraft:profile".name
execute on passengers if entity @s[type=player] run function {namespace}:minigolf/register_score with storage {namespace}:minigolf input

# Leave the minigolf course
execute on passengers if entity @s[type=player] run function golf_ball:ball/exit_player

# Teleport back to the start
tp @s {START_COORDS}
""")
	
	# Setup database function
	write_to_function(config, f"{namespace}:minigolf/setup_database", f"""
# Create the database
data modify storage {namespace}:minigolf ranking set value {DEFAULT_RANKING}
""")
	
	# Register score function
	write_to_function(config, f"{namespace}:minigolf/register_score", f"""
# If player is not in the database, add it
$execute unless data storage {namespace}:minigolf ranking[{{name:"$(name)"}}] run data modify storage {namespace}:minigolf ranking append value {{name:"$(name)",score:0}}

# Get the player's score in the database
$execute store result storage {namespace}:minigolf ranking[{{name:"$(name)"}}].score int 1 run scoreboard players get @s golf_ball.shots

# Sort the database
function {namespace}:minigolf/sort_database/main
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
""")
	
	# Sort database while loop function
	write_to_function(config, f"{namespace}:minigolf/sort_database/while_loop", f"""
# Get the highest score index
scoreboard players set #index {namespace}.data 0
scoreboard players set #highest_index {namespace}.data 0
scoreboard players set #highest_score {namespace}.data 0
data modify storage {namespace}:minigolf copy set from storage {namespace}:minigolf ranking_copy

# Loop through the database
execute if data storage {namespace}:minigolf copy[0] run function {namespace}:minigolf/sort_database/get_highest_index

# Add the highest score to the sorted database
data modify storage {namespace}:minigolf sort_input set value {{index:0}}
execute store result storage {namespace}:minigolf sort_input.index int 1 run scoreboard players get #highest_index {namespace}.data
function {namespace}:minigolf/sort_database/add_highest_score_and_remove

# Loop again if there are still scores in the database
execute if data storage {namespace}:minigolf ranking_copy[0] run function {namespace}:minigolf/sort_database/while_loop
""")
	
	# Get highest index function
	write_to_function(config, f"{namespace}:minigolf/sort_database/get_highest_index", f"""
# Get the highest index








""")

	pass

