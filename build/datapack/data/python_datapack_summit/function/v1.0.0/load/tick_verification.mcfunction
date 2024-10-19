
#> python_datapack_summit:v1.0.0/load/tick_verification
#
# @within	#minecraft:tick
#

execute if score #python_datapack_summit.major load.status matches 1 if score #python_datapack_summit.minor load.status matches 0 if score #python_datapack_summit.patch load.status matches 0 run function python_datapack_summit:v1.0.0/tick

