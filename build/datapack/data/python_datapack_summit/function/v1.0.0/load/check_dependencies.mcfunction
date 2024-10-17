
#> python_datapack_summit:v1.0.0/load/check_dependencies
#
# @within	python_datapack_summit:v1.0.0/load/secondary
#

## Check if PythonDatapackSummit is loadable (dependencies)
scoreboard players set #dependency_error python_datapack_summit.data 0
execute if score #dependency_error python_datapack_summit.data matches 0 unless score #smithed.custom_block.major load.status matches 0.. run scoreboard players set #dependency_error python_datapack_summit.data 1
execute if score #dependency_error python_datapack_summit.data matches 0 if score #smithed.custom_block.major load.status matches 0 unless score #smithed.custom_block.minor load.status matches 3.. run scoreboard players set #dependency_error python_datapack_summit.data 1

