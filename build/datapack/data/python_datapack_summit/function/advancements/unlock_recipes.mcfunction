
#> python_datapack_summit:advancements/unlock_recipes
#
# @within	advancement python_datapack_summit:unlock_recipes
#

# Revoke advancement
advancement revoke @s only python_datapack_summit:unlock_recipes

## For each ingredient in inventory, unlock the recipes
# minecraft:stone
scoreboard players set #success python_datapack_summit.data 0
execute store success score #success python_datapack_summit.data if items entity @s container.* minecraft:stone
execute if score #success python_datapack_summit.data matches 1 run recipe give @s python_datapack_summit:stone_rod
execute if score #success python_datapack_summit.data matches 1 run recipe give @s python_datapack_summit:stone_stick

