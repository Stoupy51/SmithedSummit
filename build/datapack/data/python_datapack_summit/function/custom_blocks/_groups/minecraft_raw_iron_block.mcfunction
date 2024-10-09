
#> python_datapack_summit:custom_blocks/_groups/minecraft_raw_iron_block
#
# @within	python_datapack_summit:custom_blocks/destroy
#

execute if score #total_raw_steel_block python_datapack_summit.data matches 1.. if entity @s[tag=python_datapack_summit.raw_steel_block] run function python_datapack_summit:custom_blocks/raw_steel_block/destroy

