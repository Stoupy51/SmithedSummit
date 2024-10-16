
#> python_datapack_summit:v1.0.0/load/valid_dependencies
#
# @within	python_datapack_summit:v1.0.0/load/secondary
#			python_datapack_summit:v1.0.0/load/valid_dependencies 1t replace
#

# Waiting for a player to get the game version, but stop function if no player found
execute unless entity @p run schedule function python_datapack_summit:v1.0.0/load/valid_dependencies 1t replace
execute unless entity @p run return 0
execute store result score #game_version python_datapack_summit.data run data get entity @p DataVersion

# Check if the game version is supported
scoreboard players set #mcload_error python_datapack_summit.data 0
execute unless score #game_version python_datapack_summit.data matches 3947.. run scoreboard players set #mcload_error python_datapack_summit.data 1

# Decode errors
execute if score #mcload_error python_datapack_summit.data matches 1 run tellraw @a {"text":"PythonDatapackSummit Error: This version is made for Minecraft 1.21+.","color":"red"}
execute if score #dependency_error python_datapack_summit.data matches 1 run tellraw @a {"text":"PythonDatapackSummit Error: Libraries are missing\nplease download the right PythonDatapackSummit datapack\nor download each of these libraries one by one:","color":"red"}
execute if score #dependency_error python_datapack_summit.data matches 1 unless score #smithed.custom_block.major load.status matches 0.. run tellraw @a {"text":"- [Smithed Custom Block (v0.3.0+)]","color":"gold","clickEvent":{"action":"open_url","value":"https://wiki.smithed.dev/libraries/custom-block/"}}
execute if score #dependency_error python_datapack_summit.data matches 1 if score #smithed.custom_block.major load.status matches 0 unless score #smithed.custom_block.minor load.status matches 3.. run tellraw @a {"text":"- [Smithed Custom Block (v0.3.0+)]","color":"gold","clickEvent":{"action":"open_url","value":"https://wiki.smithed.dev/libraries/custom-block/"}}

# Load PythonDatapackSummit
execute if score #game_version python_datapack_summit.data matches 1.. if score #mcload_error python_datapack_summit.data matches 0 if score #dependency_error python_datapack_summit.data matches 0 run function python_datapack_summit:v1.0.0/load/confirm_load

