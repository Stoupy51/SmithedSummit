
#> python_datapack_summit:v1.0.0/load/confirm_load
#
# @within	python_datapack_summit:v1.0.0/load/secondary
#

tellraw @a[tag=convention.debug] {"text":"[Loaded PythonDatapackSummit v1.0.0]","color":"green"}
scoreboard players set #python_datapack_summit.loaded load.status 1

# New objectives
scoreboard objectives add python_datapack_summit.block_interaction_range dummy
scoreboard objectives add python_datapack_summit.minigolf_time dummy

# Remove the previous entities
kill @e[tag=python_datapack_summit]

# Summon bananier
summon sheep 137 61 -128 {Rotation:[-18.0f,-9.0f],Silent:1b,Invulnerable:1b,DeathLootTable:"empty",NoAI:1b,Color:15b,CustomName:'"Bananier"',Tags:["python_datapack_summit.bananier","python_datapack_summit","smithed.entity","smithed.strict","global.ignore","global.ignore.strict"]}

# Place the electric brewing stand
setblock 123 69 -123 air
summon item_display 123 69.5 -123 {item:{id:"minecraft:furnace",count:1,components:{"minecraft:custom_model_data":2010026}},Tags:["python_datapack_summit.electric_brewing_stand","python_datapack_summit"],Rotation:[180.0f,0.0f],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.0f,0.01f,0.0f],scale:[1.002f,1.025f,1.002f]}}
setblock 123 69 -123 brewing_stand{Lock:"uwu"}

# More setblocks
fill 119 69 -131 120 69 -131 air
fill 115 69 -122 114 69 -122 air
setblock 120 68 -131 air
setblock 120 68 -131 furnace[facing=south,lit=true]{Lock:"uwu"}
setblock 119 68 -131 air
setblock 119 68 -131 furnace[facing=south,lit=false]{Lock:"uwu"}
setblock 115 68 -122 air
setblock 115 68 -122 furnace[facing=north,lit=true]{Lock:"uwu"}
setblock 114 68 -122 air
setblock 114 68 -122 barrel[facing=north,open=false]{Lock:"uwu"}
fill 119 69 -131 120 69 -131 rail[shape=east_west]
fill 115 69 -122 114 69 -122 rail[shape=east_west]

# Place the blocks
summon item_display 117.0 76 -128.0 {item:{id:"minecraft:command_block",count:1,components:{"minecraft:custom_model_data":2010024}},Tags:["python_datapack_summit.stiched_texture","python_datapack_summit"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.0f,0.01f,0.0f],scale:[16.000f,16.000f,16.000f]}}

# Display the text "welcoming_1"
summon text_display 119 77 -118 {"Tags":["python_datapack_summit.welcoming_1", "python_datapack_summit"],"text":'[{"text": "Welcome to the ", "color": "gold"}, {"text": "Python Datapack", "color": "aqua"}, {"text": " Booth!"}]', "billboard": "vertical", "alignment": "center"}

# Display the text "welcoming_2"
summon text_display 119 76.5 -118 {"Tags":["python_datapack_summit.welcoming_2", "python_datapack_summit"],"text":'[{"text": "\\u1000", "color": "white", "font": "python_datapack_summit:text_display"}]', transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.04f,0.0f,0.0f],scale:[1.0f,1.0f,1.0f]}, "background": 0, "billboard": "vertical", "alignment": "center"}

# Display the text "how_to_obtain_stamp"
summon text_display 125 75 -118 {"Tags":["python_datapack_summit.how_to_obtain_stamp", "python_datapack_summit"],"text":'[{"text": "", "color": "yellow"}, {"text": "There are ", "color": "aqua"}, {"text": "two ways", "color": "aqua", "underlined": true}, {"text": " to obtain the booth stamp:\\n", "color": "aqua"}, {"text": "\\n- First way: find the hidden ", "color": "yellow"}, {"text": "idol", "color": "green"}, {"text": " in the booth.\\n", "color": "yellow"}, {"text": "\\n- Second way: head to the "}, {"text": "garden", "color": "green"}, {"text": " and find the cave entrance. You need to complete the "}, {"text": "mini-golf course", "color": "green"}, {"text": " to obtain the stamp."}]', "billboard": "vertical", "alignment": "left", "line_width": 150, "background": 1962934272}

# Display the text "special_thanks"
summon text_display 119 76 -131 {"Tags":["python_datapack_summit.special_thanks", "python_datapack_summit"],"text":'[{"text": "", "color": "green"}, {"text": "Credits", "color": "white", "underlined": true}, {"text": "\\nBooth author:", "color": "aqua"}, {"text": "\\nStoupy51", "color": "yellow"}, {"text": "\\n\\nBuilders:", "color": "aqua"}, {"text": "\\nJulDragonne"}, {"text": "\\nMizanathos"}, {"text": "\\nKchouky"}]', "billboard": "vertical", "alignment": "center"}

# Display the text "switch_minigames_1"
summon text_display 120 80 -127 {"Tags":["python_datapack_summit.switch_minigames_1", "python_datapack_summit"],"text":'[{"text": "", "color": "aqua"}, {"text": "[Switch minigames]", "color": "gold"}, " is a ", {"text": "democratic", "color": "green"}, " Minecraft server (started on August 23, 2022) like a infinite party-games", " where players can vote between ", {"text": "5 randomly selected minigames", "color": "green"}, " to play.", {"text": "\\n\\n"}, "Today, a total of ", {"text": "44 minigames", "color": "green"}, " are available.", {"text": "\\n"}, "The initial goal was an infinite amount of minigames.", {"text": "\\n"}, "A lot of the minigames are already popular so it is very likely that you already know them. For instance:", {"text": "\\nTNT Run, Kart Racer, SheepWars, Infected, Minigolf...", "color": "yellow"}, {"text": "\\n\\n"}, "The Switch minigames could be seen as a collection of the best minigames in my opinion.", {"text": "\\n"}, "Switch minigames ", {"text": "v2.0", "color": "green"}, " is currently in development and will be released around ", {"text": "December 2024.", "color": "green"}, {"text": "\\n"}, "Feel free to join the discord server (with the left sign) to get more information about the server and the upcoming update.", {"text": "\\n"}, {"text": "I highly recommend you to watch the short video with the sign on the right!", "color": "yellow"}]', Rotation:[90.0f,0.0f], transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.5f,0.15f,-0.45f],scale:[0.55f,0.55f,0.55f]}, "billboard": "fixed", "alignment": "left", "line_width": 275, "background": 1962934272}

# Display the text "switch_minigames_2"
summon text_display 120 83 -127 {"Tags":["python_datapack_summit.switch_minigames_2", "python_datapack_summit"],"text":'[{"text": "\\u1001", "color": "white", "font": "python_datapack_summit:text_display"}]', Rotation:[90.0f,0.0f], transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.46f,1.25f,-0.45f],scale:[1.0f,1.0f,1.0f]}, "background": 0, "billboard": "fixed", "alignment": "center"}

# Display the text "survisland_1"
summon text_display 139 71 -122 {"Tags":["python_datapack_summit.survisland_1", "python_datapack_summit"],"text":'[{"text": "", "color": "aqua"}, {"text": "[Survisland]", "color": "gold"}, " is a french event server based on", {"text": "\\nthe "}, {"text": "TV show Survivor", "color": "green"}, ". At this date, we have organized 20 seasons (for around 350 unique players).", {"text": "\\n\\n"}, "Players are ", {"text": "divided into tribes", "color": "yellow"}, " and must survive on a deserted island. They must build shelters, find food,", " and compete in challenges in order to ", {"text": "win immunity", "color": "green"}, ". The losing tribe must face the ", {"text": "Tribal Council", "color": "green"}, " (read the lectern in the cave for more information).", {"text": "\\n\\n"}, "Showcasing this project here is ", {"text": "pretty hard", "color": "yellow"}, " because technical features are ", {"text": "few", "color": "yellow"}, ". I take this opportunity to say that if you are interested in the concept and speak french, ", {"text": "Stoupy51 (or stoupy)", "color": "green"}, " on discord!"]', transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.0f,0.0f,0.0f],scale:[0.75f,0.75f,0.75f]}, "billboard": "vertical", "alignment": "left", "line_width": 275, "background": 1962934272}

# Display the text "survisland_2"
summon text_display 139 70.5 -122 {"Tags":["python_datapack_summit.survisland_2", "python_datapack_summit"],"text":'[{"text": "\\u1002", "color": "white", "font": "python_datapack_summit:text_display"}]', "background": 0, "billboard": "vertical", "alignment": "center"}

# Display the text "python_datapack"
summon text_display 127 74 -127 {"Tags":["python_datapack_summit.python_datapack", "python_datapack_summit"],"text":'[{"text": "", "color": "aqua"}, {"text": "[Python Datapack]\\n", "color": "gold"}, "With the introduction of Minecraft 1.20.5, lots of datapacks were broken.", {"text": "\\n"}, "This is why I created ", {"text": "Python Datapack", "color": "green"}, ". An open-source tool with the objective to make the creation of ", {"text": "extensive", "color": "yellow"}, " datapacks easier and faster through sort-of ", {"text": "data-driven", "color": "yellow"}, " development.", {"text": "\\n"}, "Put textures in a folder, define items/blocks and recipes in a python file, and run the script to generate the datapack.", {"text": "\\n\\n"}, "Python Datapack is brought to you as a ", {"text": "Python package", "color": "yellow"}, " and a ", {"text": "Template", "color": "yellow"}, ". It includes a lot of features (see the word cloud on your right), tutorials, and examples.", {"text": "\\n\\n"}, {"text": "At this date, every single project of mine is made with Python Datapack (like SimplEnergy, Switch minigames, Survisland), including this booth!", "color": "green"}, {"text": "\\n\\n"}, "The most impressive in my opinion is the automatic generation of an interactive in-game manual, get one by moving close to this text display!"]', Rotation:[90.0f,0.0f], transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.5f,0.5f,0.0f],scale:[0.55f,0.55f,0.55f]}, "billboard": "fixed", "alignment": "left", "line_width": 275, "background": 1962934272}

# Display the text "simplenergy"
summon text_display 120 70 -127 {"Tags":["python_datapack_summit.simplenergy", "python_datapack_summit"],"text":'[{"text": "", "color": "aqua"}, {"text": "[SimplEnergy]\\n", "color": "gold"}, "This is a simple technology datapack that adds an energy system.", {"text": "\\n"}, "Players can generate energy, store it, and use it to power machines.", {"text": "\\n\\n"}, "You may have seen the ", {"text": "Mechanization", "color": "green"}, " booth (made by ICY) around spawn, it is fully compatible with SimplEnergy as we use the same energy system brought by ", {"text": "Datapack Energy", "color": "green"}, "."]', transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.5f,0.0f,0.0f],scale:[0.6f,0.6f,0.6f]}, "billboard": "vertical", "alignment": "left", "line_width": 200, "background": 1962934272}

# Display the text "simplenergy_icon"
summon text_display 120 69.5 -127 {"Tags":["python_datapack_summit.simplenergy_icon", "python_datapack_summit"],"text":'[{"text": "\\u1003", "color": "white", "font": "python_datapack_summit:text_display"}]', transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.46f,0.0f,0.0f],scale:[1.0f,1.0f,1.0f]}, "background": 0, "billboard": "vertical", "alignment": "center"}

# Remaining text displays
function python_datapack_summit:minigolf/display
summon item_display 124 75 -124 {Rotation:[-45.0f,0.0f],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.0f,-0.25f,0.0f],scale:[2.0f,2.0f,0.5f]},Tags:["python_datapack_summit.word_cloud","python_datapack_summit"],item:{id:"minecraft:command_block",components:{"minecraft:custom_model_data":2010022}}}
summon item_display 124 75 -124 {Rotation:[-45.0f,0.0f],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.0f,-0.25f,0.0f],scale:[2.0f,2.0f,0.1f]},Tags:["python_datapack_summit.word_cloud_background","python_datapack_summit"],item:{id:"minecraft:command_block",components:{"minecraft:custom_model_data":2010023}}}
tag @e[tag=python_datapack_summit] add smithed.entity
tag @e[tag=python_datapack_summit] add smithed.strict
tag @e[tag=python_datapack_summit] add global.ignore
tag @e[tag=python_datapack_summit] add global.ignore.strict

# Remove the previous lecterns and signs
setblock 119 74 -131 air
setblock 139 61 -121 air
setblock 127 73 -127 air
setblock 127 73 -126 air
setblock 118 68 -122 air

setblock 126 74 -125 air
setblock 126 74 -128 air
setblock 119 80 -129 air
setblock 119 80 -124 air
setblock 133 62 -122 air

# Set the lecterns
setblock 119 74 -131 lectern[facing=south,has_book=true]{Book:{components:{"minecraft:written_book_content":{author:"Stoupy51",pages:[{raw:'"[Booth Plan]\\n\\n- Floor 1:\\nPython Datapack explanation\\n- Floor 2:\\nSwitch minigames\\n- Floor -1:\\nSimplEnergy showcase\\n- Garden and cave:\\nSurvisland\\n- Deep cave:\\nMinigolf course\\n"'}],resolved:1b,title:{raw:"Booth Plan"}}},count:1,id:"minecraft:written_book"},Page:0}
setblock 139 61 -121 lectern[facing=north,has_book=true]{Book:{components:{"minecraft:written_book_content":{author:"Mizanathos",pages:[{raw:'"In Survivor, the American version of the survival show, voting is a central aspect of the game.\\n\\nAt regular intervals, the contestants participate in a Tribal Council, where they vote to eliminate one of their own."'},{raw:'"This usually happens after a tribe has lost an immunity challenge, or once the tribes merge into one group and individual competition begins."'},{raw:'"During Tribal Council:\\n\\nEach contestant writes down the name of another contestant on a slip of paper in secret.\\n\\nThe host collects the votes and reads them aloud one by one."'},{raw:'"The player who receives the most votes is immediately eliminated from the game, often referred to as being \\"voted off the island.\\""'},{raw:'"The vote is heavily strategic. Contestants form alliances, make deals, and sometimes break promises in order to further their own game.\\n\\nThe goal is to stay in the game as long as possible, eventually making it to the Final Tribal Council, "'},{raw:'"where the remaining players face a jury of previously eliminated contestants who then vote for a winner."'}],resolved:1b,title:{raw:"Survivor Votes"}}},count:1,id:"minecraft:written_book"},Page:0}
setblock 127 73 -127 lectern[facing=west,has_book=true]{Book:{components:{"minecraft:written_book_content":{author:"",pages:[{raw:'{"color":"dark_aqua","extra":[{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/SmithedSummit"},"color":"red","text":"\\n\\nThis booth: "},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/SmithedSummit"},"color":"dark_red","text":"[here]"},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/PythonDatapackTemplate"},"color":"red","text":"\\n\\nPython Datapack Template: "},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/PythonDatapackTemplate"},"color":"dark_red","text":"[here]"},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/SimplEnergy"},"color":"red","text":"\\n\\nSimplEnergy: "},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/SimplEnergy"},"color":"dark_red","text":"[here]"},{"clickEvent":{"action":"open_url","value":"https://www.planetminecraft.com/data-pack/simplenergy/"},"color":"gold","text":"\\n[Download datapack]"},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/GolfBall"},"color":"red","text":"\\n\\nGolf Ball: "},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/GolfBall"},"color":"dark_red","text":"[here]"},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/python_datapack"},"text":"\\n\\nPython package: "},{"color":"dark_blue","text":"[here]"}],"text":"[Source codes]"}'}],resolved:1b,title:{raw:""}}},count:1,id:"minecraft:written_book"},Page:0}
setblock 127 73 -126 lectern[facing=west,has_book=true]{Book:{components:{"minecraft:written_book_content":{author:"",pages:[{raw:'{"color":"dark_aqua","extra":[{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/SmithedSummit"},"color":"red","text":"\\n\\nThis booth: "},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/SmithedSummit"},"color":"dark_red","text":"[here]"},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/PythonDatapackTemplate"},"color":"red","text":"\\n\\nPython Datapack Template: "},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/PythonDatapackTemplate"},"color":"dark_red","text":"[here]"},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/SimplEnergy"},"color":"red","text":"\\n\\nSimplEnergy: "},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/SimplEnergy"},"color":"dark_red","text":"[here]"},{"clickEvent":{"action":"open_url","value":"https://www.planetminecraft.com/data-pack/simplenergy/"},"color":"gold","text":"\\n[Download datapack]"},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/GolfBall"},"color":"red","text":"\\n\\nGolf Ball: "},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/GolfBall"},"color":"dark_red","text":"[here]"},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/python_datapack"},"text":"\\n\\nPython package: "},{"color":"dark_blue","text":"[here]"}],"text":"[Source codes]"}'}],resolved:1b,title:{raw:""}}},count:1,id:"minecraft:written_book"},Page:0}
setblock 118 68 -122 lectern[facing=north,has_book=true]{Book:{components:{"minecraft:written_book_content":{author:"",pages:[{raw:'{"color":"dark_aqua","extra":[{"clickEvent":{"action":"open_url","value":"https://www.planetminecraft.com/data-pack/simplenergy/"},"color":"red","text":"\\n\\nSimplEnergy: "},{"clickEvent":{"action":"open_url","value":"https://www.planetminecraft.com/data-pack/simplenergy/"},"color":"dark_red","text":"[here]"},{"clickEvent":{"action":"open_url","value":"https://www.planetminecraft.com/data-pack/mechanization/"},"color":"red","text":"\\n\\nMechanization: "},{"clickEvent":{"action":"open_url","value":"https://www.planetminecraft.com/data-pack/mechanization/"},"color":"dark_red","text":"[here]"},{"clickEvent":{"action":"open_url","value":"https://github.com/ICY105/DatapackEnergy"},"text":"\\n\\nDatapack Energy: "},{"clickEvent":{"action":"open_url","value":"https://github.com/ICY105/DatapackEnergy"},"color":"dark_blue","text":"[here]"}],"text":"[Links]"}'}],resolved:1b,title:{raw:""}}},count:1,id:"minecraft:written_book"},Page:0}

# Set the signs
setblock 126 74 -125 oak_wall_sign[facing=north]{front_text:{color:"blue",has_glowing_text:1b,messages:['""','{"clickEvent":{"action":"run_command","value":"/tellraw @s {\\"text\\":\\"Join the Python Datapack discord by clicking here!\\",\\"color\\":\\"blue\\",\\"clickEvent\\":{\\"action\\":\\"open_url\\",\\"value\\":\\"https://discord.com/anxzu6rA9F\\"}}"},"color":"blue","text":"Join the discord"}','{"color":"blue","text":"server here","clickEvent":{"action":"run_command","value":"/playsound ui.button.click"}}','""']},is_waxed:1b}
setblock 126 74 -128 oak_wall_sign[facing=south]{front_text:{color:"red",has_glowing_text:1b,messages:['""','{"clickEvent":{"action":"run_command","value":"/tellraw @s {\\"text\\":\\"Open the template page by clicking here!\\",\\"color\\":\\"red\\",\\"clickEvent\\":{\\"action\\":\\"open_url\\",\\"value\\":\\"https://github.com/Stoupy51/PythonDatapackTemplate\\"}}"},"color":"red","text":"Open the template"}','{"color":"red","text":"page here","clickEvent":{"action":"run_command","value":"/playsound ui.button.click"}}','""']},is_waxed:1b}
setblock 119 80 -129 oak_sign[rotation=1]{front_text:{color:"blue",has_glowing_text:1b,messages:['""','{"clickEvent":{"action":"run_command","value":"/tellraw @s {\\"text\\":\\"Join the Switch minigames discord by clicking here!\\",\\"color\\":\\"blue\\",\\"clickEvent\\":{\\"action\\":\\"open_url\\",\\"value\\":\\"https://discord.com/anxzu6rA9F\\"}}"},"color":"blue","text":"Join the discord"}','{"color":"blue","text":"server here","clickEvent":{"action":"run_command","value":"/playsound ui.button.click"}}','""']},is_waxed:1b}
setblock 119 80 -124 oak_sign[rotation=7]{front_text:{color:"red",has_glowing_text:1b,messages:['""','{"clickEvent":{"action":"run_command","value":"/tellraw @s {\\"text\\":\\"Watch Switch Memories by clicking here!\\",\\"color\\":\\"red\\",\\"clickEvent\\":{\\"action\\":\\"open_url\\",\\"value\\":\\"https://www.youtube.com/watch?v=cB27sEOxboA\\"}}"},"color":"red","text":"Watch the short"}','{"color":"red","text":"video here","clickEvent":{"action":"run_command","value":"/playsound ui.button.click"}}','""']},is_waxed:1b}
setblock 133 62 -122 spruce_wall_sign[facing=south]{front_text:{messages:['{"text":"[Mini-Golf]","color":"aqua"}','{"text":"Start the course","color":"yellow"}','{"text":"by clicking here","color":"yellow","clickEvent":{"action":"run_command","value":"/function python_datapack_summit:minigolf/start"}}','{"text":""}']}} replace

