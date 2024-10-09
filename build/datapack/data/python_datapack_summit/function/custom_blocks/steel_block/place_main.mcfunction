
#> python_datapack_summit:custom_blocks/steel_block/place_main
#
# @within	python_datapack_summit:custom_blocks/place
#

tag @s add python_datapack_summit.placer
setblock ~ ~ ~ air
setblock ~ ~ ~ minecraft:iron_block
execute align xyz positioned ~.5 ~.5 ~.5 summon item_display at @s run function python_datapack_summit:custom_blocks/steel_block/place_secondary
tag @s remove python_datapack_summit.placer

# Increment count scores
scoreboard players add #total_custom_blocks python_datapack_summit.data 1
scoreboard players add #total_vanilla_iron_block python_datapack_summit.data 1
scoreboard players add #total_steel_block python_datapack_summit.data 1

