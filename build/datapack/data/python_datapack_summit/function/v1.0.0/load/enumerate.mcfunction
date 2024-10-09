
#> python_datapack_summit:v1.0.0/load/enumerate
#
# @within	#python_datapack_summit:enumerate
#

# If current major is too low, set it to the current major
execute unless score #python_datapack_summit.major load.status matches 1.. run scoreboard players set #python_datapack_summit.major load.status 1

# If current minor is too low, set it to the current minor (only if major is correct)
execute if score #python_datapack_summit.major load.status matches 1 unless score #python_datapack_summit.minor load.status matches 0.. run scoreboard players set #python_datapack_summit.minor load.status 0

# If current patch is too low, set it to the current patch (only if major and minor are correct)
execute if score #python_datapack_summit.major load.status matches 1 if score #python_datapack_summit.minor load.status matches 0 unless score #python_datapack_summit.patch load.status matches 0.. run scoreboard players set #python_datapack_summit.patch load.status 0

