
#> python_datapack_summit:minigolf/register_score
#
# @within	python_datapack_summit:minigolf/finish with storage python_datapack_summit:minigolf input
#

# If player is not in the database, add it
$execute unless data storage python_datapack_summit:minigolf ranking[{name:"$(name)"}] run data modify storage python_datapack_summit:minigolf ranking append value {name:"$(name)",score:2024,time:0.0,time_str:"0.0"}

# Update the minigolf time (subtract the time spent on the course => result in a negative value so we multiply by -1)
scoreboard players set #-1 python_datapack_summit.data -1
scoreboard players operation @s python_datapack_summit.minigolf_time -= #total_ticks python_datapack_summit.data
scoreboard players operation @s python_datapack_summit.minigolf_time *= #-1 python_datapack_summit.data

# Check if the player got a better score
scoreboard players set #is_better_score python_datapack_summit.data 0
$execute store result score #database_score python_datapack_summit.data run data get storage python_datapack_summit:minigolf ranking[{name:"$(name)"}].score
execute if score @s golf_ball.shots < #database_score python_datapack_summit.data run scoreboard players set #is_better_score python_datapack_summit.data 1
$execute if score @s golf_ball.shots = #database_score python_datapack_summit.data store result score #database_time python_datapack_summit.data run data get storage python_datapack_summit:minigolf ranking[{name:"$(name)"}].time 20
execute if score @s golf_ball.shots = #database_score python_datapack_summit.data if score @s python_datapack_summit.minigolf_time < #database_time python_datapack_summit.data run scoreboard players set #is_better_score python_datapack_summit.data 1

# If not better, return
execute unless score #is_better_score python_datapack_summit.data matches 1 run return fail

# Get the player's score and time in the database
$execute store result storage python_datapack_summit:minigolf ranking[{name:"$(name)"}].score int 1 run scoreboard players get @s golf_ball.shots
$execute store result storage python_datapack_summit:minigolf ranking[{name:"$(name)"}].time double 0.05 run scoreboard players get @s python_datapack_summit.minigolf_time

# Insert time string in the database
$function python_datapack_summit:minigolf/time_to_string with storage python_datapack_summit:minigolf ranking[{name:"$(name)"}]

# Sort the database (if the player got a better score)
function python_datapack_summit:minigolf/sort_database/main

