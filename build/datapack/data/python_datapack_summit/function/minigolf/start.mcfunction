
#> python_datapack_summit:minigolf/start
#
# @within	???
#

# Teleport the player to the start of the minigolf course
tp @s 132 61 -121 90 0

# Change default summon values
scoreboard players set #default_do_y_shots golf_ball.data 1
scoreboard players set #default_do_collision golf_ball.data 0

# Reset scores
scoreboard players set @s golf_ball.shots 0
scoreboard players set @s golf_ball.cooldown 0

# Summon the golf ball
execute at @s run function golf_ball:summon

# Change the player's offhand item
item modify entity @s weapon.offhand python_datapack_summit:minigolf_offhand

