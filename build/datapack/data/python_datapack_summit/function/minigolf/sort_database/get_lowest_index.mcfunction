
#> python_datapack_summit:minigolf/sort_database/get_lowest_index
#
# @within	python_datapack_summit:minigolf/sort_database/while_loop
#			python_datapack_summit:minigolf/sort_database/get_lowest_index
#

# Extract the current score and time (positive time in ticks)
execute store result score #current_score python_datapack_summit.data run data get storage python_datapack_summit:minigolf copy[0].score
execute store result score #current_time python_datapack_summit.data run data get storage python_datapack_summit:minigolf copy[0].time 20

# Check if the current score is higher than the lowest score
scoreboard players set #is_current_better python_datapack_summit.data 0
execute if score #current_score python_datapack_summit.data < #lowest_score python_datapack_summit.data run scoreboard players set #is_current_better python_datapack_summit.data 1
execute if score #current_score python_datapack_summit.data = #lowest_score python_datapack_summit.data if score #current_time python_datapack_summit.data < #lowest_time python_datapack_summit.data run scoreboard players set #is_current_better python_datapack_summit.data 1

# Update the lowest values if the current score is better
execute if score #is_current_better python_datapack_summit.data matches 1 run scoreboard players operation #lowest_score python_datapack_summit.data = #current_score python_datapack_summit.data
execute if score #is_current_better python_datapack_summit.data matches 1 run scoreboard players operation #lowest_time python_datapack_summit.data = #current_time python_datapack_summit.data
execute if score #is_current_better python_datapack_summit.data matches 1 run scoreboard players operation #lowest_index python_datapack_summit.data = #index python_datapack_summit.data

# Remove the current score from the copy
data remove storage python_datapack_summit:minigolf copy[0]
scoreboard players add #index python_datapack_summit.data 1

# Loop again if there are still scores to compare in the copy
execute if data storage python_datapack_summit:minigolf copy[0] run function python_datapack_summit:minigolf/sort_database/get_lowest_index

