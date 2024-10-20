
#> python_datapack_summit:minigolf/sort_database/while_loop
#
# @within	python_datapack_summit:minigolf/sort_database/main
#			python_datapack_summit:minigolf/sort_database/while_loop
#

# Get the lowest score index
scoreboard players set #index python_datapack_summit.data 0
scoreboard players set #lowest_index python_datapack_summit.data 0
scoreboard players set #lowest_score python_datapack_summit.data 1024
scoreboard players set #lowest_time python_datapack_summit.data 0
data modify storage python_datapack_summit:minigolf copy set from storage python_datapack_summit:minigolf ranking_copy

# Loop through the database
execute if data storage python_datapack_summit:minigolf copy[0] run function python_datapack_summit:minigolf/sort_database/get_lowest_index

# Add the lowest score to the sorted database
data modify storage python_datapack_summit:minigolf sort_input set value {index:0}
execute store result storage python_datapack_summit:minigolf sort_input.index int 1 run scoreboard players get #lowest_index python_datapack_summit.data
function python_datapack_summit:minigolf/sort_database/add_lowest_score_and_remove with storage python_datapack_summit:minigolf sort_input

# Loop again if there are still scores in the database
execute if data storage python_datapack_summit:minigolf ranking_copy[0] run function python_datapack_summit:minigolf/sort_database/while_loop

