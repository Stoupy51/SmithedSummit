
#> python_datapack_summit:calls/furnace_nbt_recipes/blasting_recipes
#
# @within	#furnace_nbt_recipes:v1/blasting_recipes
#

execute if score #found furnace_nbt_recipes.data matches 0 store result score #found furnace_nbt_recipes.data if data storage furnace_nbt_recipes:main input{"components": {"minecraft:custom_data": {"python_datapack_summit": {"raw_steel": true}}}} run loot replace block ~ ~ ~ container.3 loot python_datapack_summit:i/steel_ingot
execute if score #found furnace_nbt_recipes.data matches 0 store result score #found furnace_nbt_recipes.data if data storage furnace_nbt_recipes:main input{"components": {"minecraft:custom_data": {"python_datapack_summit": {"steel_dust": true}}}} run loot replace block ~ ~ ~ container.3 loot python_datapack_summit:i/steel_ingot
execute if score #found furnace_nbt_recipes.data matches 0 store result score #found furnace_nbt_recipes.data if data storage furnace_nbt_recipes:main input{"components": {"minecraft:custom_data": {"python_datapack_summit": {"steel_ore": true}}}} run loot replace block ~ ~ ~ container.3 loot python_datapack_summit:i/steel_ingot
execute if score #found furnace_nbt_recipes.data matches 0 store result score #found furnace_nbt_recipes.data if data storage furnace_nbt_recipes:main input{"components": {"minecraft:custom_data": {"python_datapack_summit": {"deepslate_steel_ore": true}}}} run loot replace block ~ ~ ~ container.3 loot python_datapack_summit:i/steel_ingot
execute if score #found furnace_nbt_recipes.data matches 0 store result score #found furnace_nbt_recipes.data if data storage furnace_nbt_recipes:main input{"components": {"minecraft:custom_data": {"python_datapack_summit": {"steel_dust": true}}}} run loot replace block ~ ~ ~ container.3 loot python_datapack_summit:i/steel_ingot

