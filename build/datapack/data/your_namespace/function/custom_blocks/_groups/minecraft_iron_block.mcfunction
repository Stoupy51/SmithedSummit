
#> your_namespace:custom_blocks/_groups/minecraft_iron_block
#
# @within	your_namespace:custom_blocks/destroy
#

execute if score #total_steel_block your_namespace.data matches 1.. if entity @s[tag=your_namespace.steel_block] run function your_namespace:custom_blocks/steel_block/destroy

