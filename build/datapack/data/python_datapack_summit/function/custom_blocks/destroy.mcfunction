
#> python_datapack_summit:custom_blocks/destroy
#
# @within	???
#

execute if score #total_vanilla_iron_block python_datapack_summit.data matches 1.. if entity @s[tag=python_datapack_summit.vanilla.minecraft_iron_block] unless block ~ ~ ~ minecraft:iron_block run function python_datapack_summit:custom_blocks/_groups/minecraft_iron_block
execute if score #total_vanilla_polished_deepslate python_datapack_summit.data matches 1.. if entity @s[tag=python_datapack_summit.vanilla.minecraft_polished_deepslate] unless block ~ ~ ~ minecraft:polished_deepslate run function python_datapack_summit:custom_blocks/_groups/minecraft_polished_deepslate
execute if score #total_vanilla_raw_iron_block python_datapack_summit.data matches 1.. if entity @s[tag=python_datapack_summit.vanilla.minecraft_raw_iron_block] unless block ~ ~ ~ minecraft:raw_iron_block run function python_datapack_summit:custom_blocks/_groups/minecraft_raw_iron_block

