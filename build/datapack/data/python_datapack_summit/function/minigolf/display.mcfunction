
#> python_datapack_summit:minigolf/display
#
# @within	python_datapack_summit:v1.0.0/load/confirm_load
#			python_datapack_summit:minigolf/sort_database/main
#

# Setup database if not already done
execute unless data storage python_datapack_summit:minigolf ranking run function python_datapack_summit:minigolf/setup_database

# Kill the previous display
kill @e[tag=python_datapack_summit.minigolf_display]

# Display the minigolf display
summon text_display 131 61 -122 {billboard:"fixed",alignment:"left",line_width:350,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.0f,0.1f,-0.45f],scale:[0.4f,0.4f,0.4f]},text:'[{"text": "------------ [Minigolf Ranking] ------------\\n", "color": "green"}, [{"text": "\\n", "color": "gold"}, {"text": " #1 "}, {"nbt": "ranking[0].name", "storage": "python_datapack_summit:minigolf", "color": "yellow"}, {"text": " with "}, {"nbt": "ranking[0].score", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": " shots "}, {"text": "(", "color": "aqua"}, {"nbt": "ranking[0].time_str", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": "s", "color": "aqua"}, {"text": ")", "color": "aqua"}], [{"text": "\\n", "color": "gold"}, {"text": " #2 "}, {"nbt": "ranking[1].name", "storage": "python_datapack_summit:minigolf", "color": "yellow"}, {"text": " with "}, {"nbt": "ranking[1].score", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": " shots "}, {"text": "(", "color": "aqua"}, {"nbt": "ranking[1].time_str", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": "s", "color": "aqua"}, {"text": ")", "color": "aqua"}], [{"text": "\\n", "color": "gold"}, {"text": " #3 "}, {"nbt": "ranking[2].name", "storage": "python_datapack_summit:minigolf", "color": "yellow"}, {"text": " with "}, {"nbt": "ranking[2].score", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": " shots "}, {"text": "(", "color": "aqua"}, {"nbt": "ranking[2].time_str", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": "s", "color": "aqua"}, {"text": ")", "color": "aqua"}], [{"text": "\\n", "color": "gold"}, {"text": " #4 "}, {"nbt": "ranking[3].name", "storage": "python_datapack_summit:minigolf", "color": "yellow"}, {"text": " with "}, {"nbt": "ranking[3].score", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": " shots "}, {"text": "(", "color": "aqua"}, {"nbt": "ranking[3].time_str", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": "s", "color": "aqua"}, {"text": ")", "color": "aqua"}], [{"text": "\\n", "color": "gold"}, {"text": " #5 "}, {"nbt": "ranking[4].name", "storage": "python_datapack_summit:minigolf", "color": "yellow"}, {"text": " with "}, {"nbt": "ranking[4].score", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": " shots "}, {"text": "(", "color": "aqua"}, {"nbt": "ranking[4].time_str", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": "s", "color": "aqua"}, {"text": ")", "color": "aqua"}], [{"text": "\\n", "color": "gold"}, {"text": " #6 "}, {"nbt": "ranking[5].name", "storage": "python_datapack_summit:minigolf", "color": "yellow"}, {"text": " with "}, {"nbt": "ranking[5].score", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": " shots "}, {"text": "(", "color": "aqua"}, {"nbt": "ranking[5].time_str", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": "s", "color": "aqua"}, {"text": ")", "color": "aqua"}], [{"text": "\\n", "color": "gold"}, {"text": " #7 "}, {"nbt": "ranking[6].name", "storage": "python_datapack_summit:minigolf", "color": "yellow"}, {"text": " with "}, {"nbt": "ranking[6].score", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": " shots "}, {"text": "(", "color": "aqua"}, {"nbt": "ranking[6].time_str", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": "s", "color": "aqua"}, {"text": ")", "color": "aqua"}], [{"text": "\\n", "color": "gold"}, {"text": " #8 "}, {"nbt": "ranking[7].name", "storage": "python_datapack_summit:minigolf", "color": "yellow"}, {"text": " with "}, {"nbt": "ranking[7].score", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": " shots "}, {"text": "(", "color": "aqua"}, {"nbt": "ranking[7].time_str", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": "s", "color": "aqua"}, {"text": ")", "color": "aqua"}], [{"text": "\\n", "color": "gold"}, {"text": " #9 "}, {"nbt": "ranking[8].name", "storage": "python_datapack_summit:minigolf", "color": "yellow"}, {"text": " with "}, {"nbt": "ranking[8].score", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": " shots "}, {"text": "(", "color": "aqua"}, {"nbt": "ranking[8].time_str", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": "s", "color": "aqua"}, {"text": ")", "color": "aqua"}], [{"text": "\\n", "color": "gold"}, {"text": "#10 "}, {"nbt": "ranking[9].name", "storage": "python_datapack_summit:minigolf", "color": "yellow"}, {"text": " with "}, {"nbt": "ranking[9].score", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": " shots "}, {"text": "(", "color": "aqua"}, {"nbt": "ranking[9].time_str", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": "s", "color": "aqua"}, {"text": ")", "color": "aqua"}], [{"text": "\\n", "color": "gold"}, {"text": "#11 "}, {"nbt": "ranking[10].name", "storage": "python_datapack_summit:minigolf", "color": "yellow"}, {"text": " with "}, {"nbt": "ranking[10].score", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": " shots "}, {"text": "(", "color": "aqua"}, {"nbt": "ranking[10].time_str", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": "s", "color": "aqua"}, {"text": ")", "color": "aqua"}], [{"text": "\\n", "color": "gold"}, {"text": "#12 "}, {"nbt": "ranking[11].name", "storage": "python_datapack_summit:minigolf", "color": "yellow"}, {"text": " with "}, {"nbt": "ranking[11].score", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": " shots "}, {"text": "(", "color": "aqua"}, {"nbt": "ranking[11].time_str", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": "s", "color": "aqua"}, {"text": ")", "color": "aqua"}], [{"text": "\\n", "color": "gold"}, {"text": "#13 "}, {"nbt": "ranking[12].name", "storage": "python_datapack_summit:minigolf", "color": "yellow"}, {"text": " with "}, {"nbt": "ranking[12].score", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": " shots "}, {"text": "(", "color": "aqua"}, {"nbt": "ranking[12].time_str", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": "s", "color": "aqua"}, {"text": ")", "color": "aqua"}], [{"text": "\\n", "color": "gold"}, {"text": "#14 "}, {"nbt": "ranking[13].name", "storage": "python_datapack_summit:minigolf", "color": "yellow"}, {"text": " with "}, {"nbt": "ranking[13].score", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": " shots "}, {"text": "(", "color": "aqua"}, {"nbt": "ranking[13].time_str", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": "s", "color": "aqua"}, {"text": ")", "color": "aqua"}], [{"text": "\\n", "color": "gold"}, {"text": "#15 "}, {"nbt": "ranking[14].name", "storage": "python_datapack_summit:minigolf", "color": "yellow"}, {"text": " with "}, {"nbt": "ranking[14].score", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": " shots "}, {"text": "(", "color": "aqua"}, {"nbt": "ranking[14].time_str", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": "s", "color": "aqua"}, {"text": ")", "color": "aqua"}], [{"text": "\\n", "color": "gold"}, {"text": "#16 "}, {"nbt": "ranking[15].name", "storage": "python_datapack_summit:minigolf", "color": "yellow"}, {"text": " with "}, {"nbt": "ranking[15].score", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": " shots "}, {"text": "(", "color": "aqua"}, {"nbt": "ranking[15].time_str", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": "s", "color": "aqua"}, {"text": ")", "color": "aqua"}], [{"text": "\\n", "color": "gold"}, {"text": "#17 "}, {"nbt": "ranking[16].name", "storage": "python_datapack_summit:minigolf", "color": "yellow"}, {"text": " with "}, {"nbt": "ranking[16].score", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": " shots "}, {"text": "(", "color": "aqua"}, {"nbt": "ranking[16].time_str", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": "s", "color": "aqua"}, {"text": ")", "color": "aqua"}], [{"text": "\\n", "color": "gold"}, {"text": "#18 "}, {"nbt": "ranking[17].name", "storage": "python_datapack_summit:minigolf", "color": "yellow"}, {"text": " with "}, {"nbt": "ranking[17].score", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": " shots "}, {"text": "(", "color": "aqua"}, {"nbt": "ranking[17].time_str", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": "s", "color": "aqua"}, {"text": ")", "color": "aqua"}], [{"text": "\\n", "color": "gold"}, {"text": "#19 "}, {"nbt": "ranking[18].name", "storage": "python_datapack_summit:minigolf", "color": "yellow"}, {"text": " with "}, {"nbt": "ranking[18].score", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": " shots "}, {"text": "(", "color": "aqua"}, {"nbt": "ranking[18].time_str", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": "s", "color": "aqua"}, {"text": ")", "color": "aqua"}], [{"text": "\\n", "color": "gold"}, {"text": "#20 "}, {"nbt": "ranking[19].name", "storage": "python_datapack_summit:minigolf", "color": "yellow"}, {"text": " with "}, {"nbt": "ranking[19].score", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": " shots "}, {"text": "(", "color": "aqua"}, {"nbt": "ranking[19].time_str", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": "s", "color": "aqua"}, {"text": ")", "color": "aqua"}], [{"text": "\\n", "color": "gold"}, {"text": "#21 "}, {"nbt": "ranking[20].name", "storage": "python_datapack_summit:minigolf", "color": "yellow"}, {"text": " with "}, {"nbt": "ranking[20].score", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": " shots "}, {"text": "(", "color": "aqua"}, {"nbt": "ranking[20].time_str", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": "s", "color": "aqua"}, {"text": ")", "color": "aqua"}], [{"text": "\\n", "color": "gold"}, {"text": "#22 "}, {"nbt": "ranking[21].name", "storage": "python_datapack_summit:minigolf", "color": "yellow"}, {"text": " with "}, {"nbt": "ranking[21].score", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": " shots "}, {"text": "(", "color": "aqua"}, {"nbt": "ranking[21].time_str", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": "s", "color": "aqua"}, {"text": ")", "color": "aqua"}], [{"text": "\\n", "color": "gold"}, {"text": "#23 "}, {"nbt": "ranking[22].name", "storage": "python_datapack_summit:minigolf", "color": "yellow"}, {"text": " with "}, {"nbt": "ranking[22].score", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": " shots "}, {"text": "(", "color": "aqua"}, {"nbt": "ranking[22].time_str", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": "s", "color": "aqua"}, {"text": ")", "color": "aqua"}], [{"text": "\\n", "color": "gold"}, {"text": "#24 "}, {"nbt": "ranking[23].name", "storage": "python_datapack_summit:minigolf", "color": "yellow"}, {"text": " with "}, {"nbt": "ranking[23].score", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": " shots "}, {"text": "(", "color": "aqua"}, {"nbt": "ranking[23].time_str", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": "s", "color": "aqua"}, {"text": ")", "color": "aqua"}], [{"text": "\\n", "color": "gold"}, {"text": "#25 "}, {"nbt": "ranking[24].name", "storage": "python_datapack_summit:minigolf", "color": "yellow"}, {"text": " with "}, {"nbt": "ranking[24].score", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": " shots "}, {"text": "(", "color": "aqua"}, {"nbt": "ranking[24].time_str", "storage": "python_datapack_summit:minigolf", "color": "aqua"}, {"text": "s", "color": "aqua"}, {"text": ")", "color": "aqua"}]]',Tags:["python_datapack_summit.minigolf_display","python_datapack_summit","smithed.entity","smithed.strict","global.ignore","global.ignore.strict"]}

