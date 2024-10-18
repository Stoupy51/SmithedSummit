
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
tellraw @s [{"text":"- Total 'Steel Block': ","color":"gold"},{"score":{"name":"#total_steel_block","objective":"python_datapack_summit.data"},"color":"yellow"}]
tellraw @s [{"text":"- Total 'Steel Ore': ","color":"gold"},{"score":{"name":"#total_steel_ore","objective":"python_datapack_summit.data"},"color":"yellow"}]
tellraw @s [{"text":"- Total 'Deepslate Steel Ore': ","color":"gold"},{"score":{"name":"#total_deepslate_steel_ore","objective":"python_datapack_summit.data"},"color":"yellow"}]
tellraw @s [{"text":"- Total 'Raw Steel Block': ","color":"gold"},{"score":{"name":"#total_raw_steel_block","objective":"python_datapack_summit.data"},"color":"yellow"}]
tellraw @s [{"text":"- Vanilla 'minecraft:iron_block': ","color":"gray"},{"score":{"name":"#total_vanilla_iron_block","objective":"python_datapack_summit.data"},"color":"white"}]
tellraw @s [{"text":"- Vanilla 'minecraft:polished_deepslate': ","color":"gray"},{"score":{"name":"#total_vanilla_polished_deepslate","objective":"python_datapack_summit.data"},"color":"white"}]
tellraw @s [{"text":"- Vanilla 'minecraft:raw_iron_block': ","color":"gray"},{"score":{"name":"#total_vanilla_raw_iron_block","objective":"python_datapack_summit.data"},"color":"white"}]
tellraw @s [{"text":"- Total custom blocks: ","color":"dark_aqua"},{"score":{"name":"#total_custom_blocks","objective":"python_datapack_summit.data"},"color":"aqua"}]

