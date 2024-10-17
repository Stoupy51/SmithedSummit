
#> python_datapack_summit:v1.0.0/load/confirm_load
#
# @within	python_datapack_summit:v1.0.0/load/valid_dependencies
#

tellraw @a[tag=convention.debug] {"translate":"python_datapack_summit.loaded_pythondatapacksummit_v1_0_0","color":"green"}
scoreboard players set #python_datapack_summit.loaded load.status 1

# Display the text "welcoming"
kill @e[tag=python_datapack_summit.welcoming,tag=python_datapack_summit]
summon text_display 119 75 -117 {"Tags":['python_datapack_summit.welcoming', 'python_datapack_summit', 'smithed.entity', 'smithed.strict', 'global.ignore', 'global.ignore.strict'],"text":'[{"translate":"python_datapack_summit.welcome_to_the_python_datapack_booth", "color": "gold"}, {"text":"\\u1000", "color": "white", "font": "python_datapack_summit:text_display"}]'}

