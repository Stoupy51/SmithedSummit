
#> python_datapack_summit:custom_blocks/raw_steel_block/destroy
#
# @within	python_datapack_summit:custom_blocks/_groups/minecraft_raw_iron_block
#

# Replace the item with the custom one
execute as @e[type=item,nbt={Item:{id:"minecraft:raw_iron_block"}},limit=1,sort=nearest,distance=..1] run function python_datapack_summit:custom_blocks/raw_steel_block/replace_item

# Decrease count scores
scoreboard players remove #total_custom_blocks python_datapack_summit.data 1
scoreboard players remove #total_vanilla_raw_iron_block python_datapack_summit.data 1
scoreboard players remove #total_raw_steel_block python_datapack_summit.data 1

# Kill the custom block entity
kill @s

