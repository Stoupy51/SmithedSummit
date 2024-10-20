
#> python_datapack_summit:v1.0.0/second
#
# @within	python_datapack_summit:v1.0.0/tick
#

# Reset timer
scoreboard players set #second python_datapack_summit.data 0

execute unless data block 137 69 -131 Items[].components."minecraft:custom_data".python_datapack_summit.pendant run loot insert 137 69 -131 loot python_datapack_summit:i/pendant

