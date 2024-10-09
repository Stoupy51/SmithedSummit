
#> python_datapack_summit:custom_blocks/get_rotation
#
# @within	???
#

# Set up score
scoreboard players set #rotation python_datapack_summit.data 0

# Player case
execute if score #rotation python_datapack_summit.data matches 0 if entity @s[y_rotation=-46..45] run scoreboard players set #rotation python_datapack_summit.data 1
execute if score #rotation python_datapack_summit.data matches 0 if entity @s[y_rotation=45..135] run scoreboard players set #rotation python_datapack_summit.data 2
execute if score #rotation python_datapack_summit.data matches 0 if entity @s[y_rotation=135..225] run scoreboard players set #rotation python_datapack_summit.data 3
execute if score #rotation python_datapack_summit.data matches 0 if entity @s[y_rotation=225..315] run scoreboard players set #rotation python_datapack_summit.data 4

# Predicate case
execute if score #rotation python_datapack_summit.data matches 0 if predicate python_datapack_summit:facing/north run scoreboard players set #rotation python_datapack_summit.data 1
execute if score #rotation python_datapack_summit.data matches 0 if predicate python_datapack_summit:facing/east run scoreboard players set #rotation python_datapack_summit.data 2
execute if score #rotation python_datapack_summit.data matches 0 if predicate python_datapack_summit:facing/south run scoreboard players set #rotation python_datapack_summit.data 3
execute if score #rotation python_datapack_summit.data matches 0 if predicate python_datapack_summit:facing/west run scoreboard players set #rotation python_datapack_summit.data 4
# No more cases for now

