
#> python_datapack_summit:advancements/exit_booth
#
# @within	advancement python_datapack_summit:exit_booth
#

# Revoke enter booth advancement and the temporary tag
advancement revoke @s only python_datapack_summit:enter_booth
tag @s remove python_datapack_summit.in_booth

# Ignore adventure players
execute unless entity @s[gamemode=adventure] run return 1

# Modify player.block_interaction_range back to default
data modify storage python_datapack_summit:main input set value {"value":0.0}
execute store result storage python_datapack_summit:main input.value double 0.01 run scoreboard players get @s python_datapack_summit.block_interaction_range
function python_datapack_summit:advancements/exit_booth_modify_range with storage python_datapack_summit:main input

