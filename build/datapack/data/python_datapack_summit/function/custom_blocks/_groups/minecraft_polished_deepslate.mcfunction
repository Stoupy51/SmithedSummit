
#> python_datapack_summit:custom_blocks/_groups/minecraft_polished_deepslate
#
# @within	python_datapack_summit:custom_blocks/destroy
#

execute if score #total_steel_ore python_datapack_summit.data matches 1.. if entity @s[tag=python_datapack_summit.steel_ore] run function python_datapack_summit:custom_blocks/steel_ore/destroy
execute if score #total_deepslate_steel_ore python_datapack_summit.data matches 1.. if entity @s[tag=python_datapack_summit.deepslate_steel_ore] run function python_datapack_summit:custom_blocks/deepslate_steel_ore/destroy

