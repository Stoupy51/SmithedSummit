
#> python_datapack_summit:minigolf/finish
#
# @within	python_datapack_summit:v1.0.0/tick
#

# Setup database if not already done
execute unless data storage python_datapack_summit:minigolf ranking run function python_datapack_summit:minigolf/setup_database

# Register the score for the player
data modify storage python_datapack_summit:minigolf input set value {name:""}
data modify storage python_datapack_summit:minigolf input.name set from entity @s item.components."minecraft:profile".name
execute on vehicle on passengers if entity @s[type=player] run function python_datapack_summit:minigolf/register_score with storage python_datapack_summit:minigolf input

# Leave the minigolf course
execute on vehicle on passengers if entity @s[type=player] positioned 133 62 -121 run function golf_ball:ball/exit_player

