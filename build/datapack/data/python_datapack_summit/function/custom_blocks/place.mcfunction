
#> python_datapack_summit:custom_blocks/place
#
# @within	python_datapack_summit:custom_blocks/on_place
#

tag @s add python_datapack_summit.placer
execute if data storage smithed.custom_block:main blockApi{id:"python_datapack_summit:steel_block"} run function python_datapack_summit:custom_blocks/steel_block/place_main
execute if data storage smithed.custom_block:main blockApi{id:"python_datapack_summit:steel_ore"} run function python_datapack_summit:custom_blocks/steel_ore/place_main
execute if data storage smithed.custom_block:main blockApi{id:"python_datapack_summit:deepslate_steel_ore"} run function python_datapack_summit:custom_blocks/deepslate_steel_ore/place_main
execute if data storage smithed.custom_block:main blockApi{id:"python_datapack_summit:raw_steel_block"} run function python_datapack_summit:custom_blocks/raw_steel_block/place_main
tag @s remove python_datapack_summit.placer

