
#> python_datapack_summit:minigolf/start
#
# @within	???
#

# Stop if the offhand and latest hotbar slot are not empty
scoreboard players set #is_empty python_datapack_summit.data 1
execute if score #is_empty python_datapack_summit.data matches 1 if items entity @s weapon.offhand * run scoreboard players set #is_empty python_datapack_summit.data 0
execute if score #is_empty python_datapack_summit.data matches 1 if items entity @s hotbar.8 * run scoreboard players set #is_empty python_datapack_summit.data 0
execute if score #is_empty python_datapack_summit.data matches 0 run tellraw @s ["",{"text":"[Python Datapack]","color":"gold"},{"text":" Please clear your offhand and last hotbar slot before starting the minigolf course.","color":"yellow"}]
execute if score #is_empty python_datapack_summit.data matches 0 run playsound entity.villager.no
execute if score #is_empty python_datapack_summit.data matches 0 run return 1

# Teleport the player to the start of the minigolf course
tp @s 132 61 -121 90 0

# Grant booth stamp
advancement grant @s only smithed_passport:visit_booth/python_datapack

# Change default summon values
scoreboard players set #default_do_y_shots golf_ball.data 1
scoreboard players set #default_do_collision golf_ball.data 0

# Reset scores
scoreboard players set @s golf_ball.shots 0
scoreboard players set @s golf_ball.cooldown 0
scoreboard players operation @s python_datapack_summit.minigolf_time = #total_ticks python_datapack_summit.data

# Summon the golf ball
execute at @s run function golf_ball:summon

# Change the player's offhand item
item modify entity @s weapon.offhand python_datapack_summit:minigolf_offhand

