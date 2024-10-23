
#> python_datapack_summit:advancements/exit_booth
#
# @within	advancement python_datapack_summit:exit_booth
#

# Revoke enter booth advancement, get manual advancement, and the temporary tag
advancement revoke @s only python_datapack_summit:enter_booth
advancement revoke @s only python_datapack_summit:manual
tag @s remove python_datapack_summit.in_booth

# If riding a golf ball, exit it
execute on vehicle if entity @s[tag=golf_ball.base] on passengers if entity @s[type=player] run function golf_ball:ball/exit_player

# Ignore non-adventure players
execute unless entity @s[gamemode=adventure] run return 1

# Clear some items
clear @s *[custom_data~{"python_datapack_summit":{"clear_on_exit":true}}]

# Modify player.block_interaction_range back to default
data modify storage python_datapack_summit:main input set value {"value":0.0}
execute store result storage python_datapack_summit:main input.value double 0.01 run scoreboard players get @s python_datapack_summit.block_interaction_range
function python_datapack_summit:advancements/exit_booth_modify_range with storage python_datapack_summit:main input

