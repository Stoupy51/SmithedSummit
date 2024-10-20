
#> python_datapack_summit:v1.0.0/tick
#
# @within	python_datapack_summit:v1.0.0/load/tick_verification
#

# Timers
scoreboard players add #second python_datapack_summit.data 1
execute if score #second python_datapack_summit.data matches 20.. run function python_datapack_summit:v1.0.0/second

# Track the total number of ticks (used for timings)
scoreboard players add #total_ticks python_datapack_summit.data 1

# Check if the player finished the minigolf course
execute if score #total_balls golf_ball.data matches 1.. as @e[tag=golf_ball.display,x=109,y=59,z=-130,dx=0,dy=0,dz=0] run function python_datapack_summit:minigolf/finish

