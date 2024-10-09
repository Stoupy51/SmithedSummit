
#> python_datapack_summit:calls/simpledrawer/raw_steel/main
#
# @within	python_datapack_summit:calls/simpledrawer/raw_steel/block
#			python_datapack_summit:calls/simpledrawer/raw_steel/ingot
#

# Set score of material found to 1
scoreboard players set #success_material simpledrawer.io 1

# Set the convert counts
scoreboard players set #ingot_in_block simpledrawer.io 9
scoreboard players set #nugget_in_ingot simpledrawer.io 9

# Set the material data
data modify storage simpledrawer:io material set value {material: "python_datapack_summit.raw_steel", material_name:'Raw Steel'}

# Fill the NBT with your own items
data modify storage simpledrawer:io material.block.item set from storage python_datapack_summit:items all.raw_steel_block
data modify storage simpledrawer:io material.ingot.item set from storage python_datapack_summit:items all.raw_steel

