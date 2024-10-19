
#> python_datapack_summit:minigolf/finish
#
# @within	python_datapack_summit:v1.0.0/tick
#

# Setup database if not already done
execute unless data storage python_datapack_summit:minigolf_database run function python_datapack_summit:minigolf/setup_database

# Register the score for the player
execute on passengers if entity @s[type=player] run function python_datapack_summit:minigolf/register_score

# Leave the minigolf course
execute on passengers if entity @s[type=player] run function golf_ball:ball/exit_player

# Teleport back to the start
tp @s 132 61 -121 90 0

