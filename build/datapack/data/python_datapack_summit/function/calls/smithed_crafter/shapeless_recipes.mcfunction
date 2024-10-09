
#> python_datapack_summit:calls/smithed_crafter/shapeless_recipes
#
# @within	#smithed.crafter:event/shapeless_recipes
#

execute if score @s smithed.data matches 0 store result score @s smithed.data if score count smithed.data matches 1 if data storage smithed.crafter:input {"recipe": [{"count": 1, "components": {"minecraft:custom_data": {"python_datapack_summit": {"steel_block": true}}}}]} run loot replace block ~ ~ ~ container.16 loot python_datapack_summit:i/steel_ingot_x9
execute if score @s smithed.data matches 0 store result score @s smithed.data if score count smithed.data matches 1 if data storage smithed.crafter:input {"recipe": [{"count": 1, "components": {"minecraft:custom_data": {"python_datapack_summit": {"steel_ingot": true}}}}]} run loot replace block ~ ~ ~ container.16 loot python_datapack_summit:i/steel_nugget_x9

