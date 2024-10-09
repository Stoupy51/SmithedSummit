
#> python_datapack_summit:_stats_custom_blocks
#
# @within	???
#

scoreboard players add #total_custom_blocks python_datapack_summit.data 0
scoreboard players add #total_vanilla_raw_iron_block python_datapack_summit.data 0
scoreboard players add #total_vanilla_polished_deepslate python_datapack_summit.data 0
scoreboard players add #total_vanilla_iron_block python_datapack_summit.data 0
scoreboard players add #total_raw_steel_block python_datapack_summit.data 0
scoreboard players add #total_deepslate_steel_ore python_datapack_summit.data 0
scoreboard players add #total_steel_ore python_datapack_summit.data 0
scoreboard players add #total_steel_block python_datapack_summit.data 0
tellraw @s [{"translate":"python_datapack_summit.total_steel_block","color":"gold"},{"score":{"name":"#total_steel_block","objective":"python_datapack_summit.data"},"color":"yellow"}]
tellraw @s [{"translate":"python_datapack_summit.total_steel_ore","color":"gold"},{"score":{"name":"#total_steel_ore","objective":"python_datapack_summit.data"},"color":"yellow"}]
tellraw @s [{"translate":"python_datapack_summit.total_deepslate_steel_ore","color":"gold"},{"score":{"name":"#total_deepslate_steel_ore","objective":"python_datapack_summit.data"},"color":"yellow"}]
tellraw @s [{"translate":"python_datapack_summit.total_raw_steel_block","color":"gold"},{"score":{"name":"#total_raw_steel_block","objective":"python_datapack_summit.data"},"color":"yellow"}]
tellraw @s [{"translate":"python_datapack_summit.vanilla_minecraft_iron_block","color":"gray"},{"score":{"name":"#total_vanilla_iron_block","objective":"python_datapack_summit.data"},"color":"white"}]
tellraw @s [{"translate":"python_datapack_summit.vanilla_minecraft_polished_deepslate","color":"gray"},{"score":{"name":"#total_vanilla_polished_deepslate","objective":"python_datapack_summit.data"},"color":"white"}]
tellraw @s [{"translate":"python_datapack_summit.vanilla_minecraft_raw_iron_block","color":"gray"},{"score":{"name":"#total_vanilla_raw_iron_block","objective":"python_datapack_summit.data"},"color":"white"}]
tellraw @s [{"translate":"python_datapack_summit.total_custom_blocks","color":"dark_aqua"},{"score":{"name":"#total_custom_blocks","objective":"python_datapack_summit.data"},"color":"aqua"}]

