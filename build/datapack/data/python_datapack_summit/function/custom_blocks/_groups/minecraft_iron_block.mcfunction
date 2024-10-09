
#> python_datapack_summit:custom_blocks/_groups/minecraft_iron_block
#
# @within	python_datapack_summit:custom_blocks/destroy
#

execute if score #total_steel_block python_datapack_summit.data matches 1.. if entity @s[tag=python_datapack_summit.steel_block] run function python_datapack_summit:custom_blocks/steel_block/destroy

