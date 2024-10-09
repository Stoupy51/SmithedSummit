
#> python_datapack_summit:custom_blocks/steel_block/replace_item
#
# @within	python_datapack_summit:custom_blocks/steel_block/destroy
#

data modify entity @s Item.components set from storage python_datapack_summit:items all.steel_block.components
data modify entity @s Item.id set from storage python_datapack_summit:items all.steel_block.id

