
#> python_datapack_summit:advancements/enter_booth
#
# @within	advancement python_datapack_summit:enter_booth
#

# Revoke exit booth advancement and a temporary tag
advancement revoke @s only python_datapack_summit:exit_booth
tag @s add python_datapack_summit.in_booth

# Ignore adventure players
execute unless entity @s[gamemode=adventure] run return 1

# Remember previous player.block_interaction_range
execute store result score @s python_datapack_summit.block_interaction_range run attribute @s player.block_interaction_range base get 100

# Modify player.block_interaction_range (to allow interaction with the lecterns and signs)
attribute @s player.block_interaction_range base set 4.5

