
#> python_datapack_summit:v1.0.0/load/main
#
# @within	python_datapack_summit:v1.0.0/load/resolve
#

# Avoiding multiple executions of the same load function
execute unless score #python_datapack_summit.loaded load.status matches 1 run function python_datapack_summit:v1.0.0/load/secondary

