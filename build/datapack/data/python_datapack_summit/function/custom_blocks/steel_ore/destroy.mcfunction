
#> python_datapack_summit:custom_blocks/steel_ore/destroy
#
# @within	python_datapack_summit:custom_blocks/_groups/minecraft_polished_deepslate
#

# Replace the item with the custom one
execute as @e[type=item,nbt={Item:{id:"minecraft:polished_deepslate"}},limit=1,sort=nearest,distance=..1] run function python_datapack_summit:custom_blocks/steel_ore/replace_item

# Decrease count scores
scoreboard players remove #total_custom_blocks python_datapack_summit.data 1
scoreboard players remove #total_vanilla_polished_deepslate python_datapack_summit.data 1
scoreboard players remove #total_steel_ore python_datapack_summit.data 1

# Kill the custom block entity
kill @s

