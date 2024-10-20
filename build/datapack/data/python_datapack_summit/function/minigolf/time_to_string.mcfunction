
#> python_datapack_summit:minigolf/time_to_string
#
# @within	python_datapack_summit:minigolf/register_score with storage python_datapack_summit:minigolf ranking[{name:"$(name)"}]
#

# Convert the time to a string
$data modify storage python_datapack_summit:minigolf time_str set value "$(time)"

# If the time_str is like "11.950000000000001", change it to "11.95"
$execute if score @s python_datapack_summit.minigolf_time matches 1..199 run data modify storage python_datapack_summit:minigolf ranking[{name:"$(name)"}].time_str set string storage python_datapack_summit:minigolf time_str 0 4
$execute if score @s python_datapack_summit.minigolf_time matches 200..1999 run data modify storage python_datapack_summit:minigolf ranking[{name:"$(name)"}].time_str set string storage python_datapack_summit:minigolf time_str 0 5
$execute if score @s python_datapack_summit.minigolf_time matches 2000..19999 run data modify storage python_datapack_summit:minigolf ranking[{name:"$(name)"}].time_str set string storage python_datapack_summit:minigolf time_str 0 6
$execute if score @s python_datapack_summit.minigolf_time matches 20000..199999 run data modify storage python_datapack_summit:minigolf ranking[{name:"$(name)"}].time_str set string storage python_datapack_summit:minigolf time_str 0 7

