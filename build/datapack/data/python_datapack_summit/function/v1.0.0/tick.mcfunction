
#> python_datapack_summit:v1.0.0/tick
#
# @within	python_datapack_summit:v1.0.0/load/tick_verification
#

# Check if the player finished the minigolf course
execute if score #total_balls golf_ball.data matches 1.. as @e[tag=golf_ball.display,x=109,y=59,z=-130,dx=0,dy=0,dz=0] run function python_datapack_summit:minigolf/finish

