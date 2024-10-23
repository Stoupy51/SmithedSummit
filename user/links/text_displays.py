
# Imports
from python_datapack.utils.io import *

# Constants
CONVENTION_TAGS: list[str] = ["smithed.entity","smithed.strict","global.ignore","global.ignore.strict"]
CUSTOM_FONTS: dict[str,str] = {
	"icon": r"\u1000",
	"switch_icon": r"\u1001",
	"survisland_icon": r"\u1002",
	"simplenergy_icon": r"\u1003",
}

# Main function to place the text displays
def main(config: dict) -> None:
	database: dict[str, dict] = config["database"]
	namespace: str = config["namespace"]
	assets_folder: str = config["assets_folder"]

	# Make the fonts
	write_to_file(f"{config['build_resource_pack']}/assets/{namespace}/font/text_display.json", super_json_dump({
		"providers": [
			{"type":"bitmap","file":"python_datapack_summit:text_display/icon.png",				"ascent":10,"height":64,"chars":[CUSTOM_FONTS["icon"]]},
			{"type":"bitmap","file":"python_datapack_summit:text_display/switch_icon.png",		"ascent":10,"height":64,"chars":[CUSTOM_FONTS["switch_icon"]]},
			{"type":"bitmap","file":"python_datapack_summit:text_display/survisland_icon.png",	"ascent":10,"height":64,"chars":[CUSTOM_FONTS["survisland_icon"]]},
			{"type":"bitmap","file":"python_datapack_summit:text_display/simplenergy_icon.png",	"ascent":10,"height":64,"chars":[CUSTOM_FONTS["simplenergy_icon"]]},
		]
	}).replace("\\\\", "\\"))
	super_copy(f"{assets_folder}/original_icon.png", f"{config['build_resource_pack']}/assets/{namespace}/textures/text_display/icon.png")
	super_copy(f"{assets_folder}/switch_icon.png", f"{config['build_resource_pack']}/assets/{namespace}/textures/text_display/switch_icon.png")
	super_copy(f"{assets_folder}/survisland_icon.png", f"{config['build_resource_pack']}/assets/{namespace}/textures/text_display/survisland_icon.png")
	super_copy(f"{assets_folder}/simplenergy_icon.png", f"{config['build_resource_pack']}/assets/{namespace}/textures/text_display/simplenergy_icon.png")

	# Text displays
	TEXT_DISPLAYS: dict[str, dict] = {
		"welcoming_1": {
			"position": [119, 77, -118],
			"text": [
				{"text":"Welcome to the ","color":"gold"},
				{"text":"Python Datapack","color":"aqua"},
				{"text":" Booth!"},
			],
			"billboard": "vertical",
			"alignment": "center",
		},
		"welcoming_2": {
			"position": [119, 76.5, -118],
			"text": [
				{"text":CUSTOM_FONTS["icon"],"color":"white","font":f"{namespace}:text_display"},
			],
			"background": 0,
			"billboard": "vertical",
			"alignment": "center",
			"transformation": "{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.04f,0.0f,0.0f],scale:[1.0f,1.0f,1.0f]}"
		},

		# How to obtain the booth stamp
		"how_to_obtain_stamp": {
			"position": [125, 75, -118],
			"text": [
				{"text":"","color":"yellow"},
				{"text":"There are ","color":"aqua"},
				{"text":"two ways","color":"aqua","underlined":True},
				{"text":" to obtain the booth stamp:\\n","color":"aqua"},

				{"text":"\\n- First way: find the hidden ","color":"yellow"},
				{"text":"idol","color":"green"},
				{"text":" in the booth.\\n","color":"yellow"},

				{"text":"\\n- Second way: head to the "},
				{"text":"garden","color":"green"},
				{"text":" and find the cave entrance. You need to start at least one "},
				{"text":"mini-golf course","color":"green"},
				{"text":" to obtain the stamp."},
			],
			"billboard": "vertical",
			"alignment": "left",
			"line_width": 150,
			"background": 1962934272,
		},

		# Special thanks
		"special_thanks": {
			"position": [119, 76, -131],
			"text": [
				{"text":"","color":"green"},
				{"text":"Credits","color":"white","underlined":True},
				{"text":"\\nBooth author:","color":"aqua"},
				{"text":"\\nStoupy51","color":"yellow"},
				{"text":"\\n\\nBuilders:","color":"aqua"},
				{"text":"\\nJulDragonne"},
				{"text":"\\nMizanathos"},
				{"text":"\\nKchouky"},
			],
			"billboard": "vertical",
			"alignment": "center",
		},

		# Switch minigames
		"switch_minigames_1": {
			"position": [120, 80, -127],
			"text": [
				{"text":"","color":"aqua"},
				{"text":"[Switch minigames]","color":"gold"},
				" is a ",
				{"text":"democratic","color":"green"},
				" Minecraft server (started on August 23, 2022) like a infinite party-games",
				" where players can vote between ",
				{"text":"5 randomly selected minigames","color":"green"},
				" to play.",
				{"text":"\\n\\n"},
				"Today, a total of ",
				{"text":"44 minigames","color":"green"},
				" are available.",
				{"text":"\\n"},
				"The initial goal was an infinite amount of minigames.",
				{"text":"\\n"},
				"A lot of the minigames are already popular so it is very likely that you already know them. For instance:",
				{"text":"\\nTNT Run, Kart Racer, SheepWars, Infected, Minigolf...","color":"yellow"},
				{"text":"\\n\\n"},
				"The Switch minigames could be seen as a collection of the best minigames in my opinion.",
				{"text":"\\n"},
				"Switch minigames ",
				{"text":"v2.0","color":"green"},
				" is currently in development and will be released around ",
				{"text":"December 2024.","color":"green"},
				{"text":"\\n"},
				"Feel free to join the discord server (with the left sign) to get more information about the server and the upcoming update.",
				{"text":"\\n"},
				{"text":"I highly recommend you to watch the short video with the sign on the right!","color":"yellow"},
			],
			"billboard": "fixed",
			"alignment": "left",
			"line_width": 275,
			"Rotation": [90.0, 0.0],
			"background": 1962934272,
			"transformation": "{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.5f,0.15f,-0.45f],scale:[0.55f,0.55f,0.55f]}"
		},
		"switch_minigames_2": {
			"position": [120, 83, -127],
			"text": [
				{"text":CUSTOM_FONTS["switch_icon"],"color":"white","font":f"{namespace}:text_display"},
			],
			"background": 0,
			"billboard": "fixed",
			"alignment": "center",
			"Rotation": [90.0, 0.0],
			"transformation": "{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.46f,1.25f,-0.45f],scale:[1.0f,1.0f,1.0f]}"
		},

		# Survisland
		"survisland_1": {
			"position": [139, 71, -122],
			"text": [
				{"text":"","color":"aqua"},
				{"text":"[Survisland]","color":"gold"},
				" is a french event server based on",
				{"text":"\\nthe "},
				{"text":"TV show Survivor","color":"green"},
				". At this date, we have organized 20 seasons (for around 350 unique players).",
				{"text":"\\n\\n"},
				"Players are ",
				{"text":"divided into tribes","color":"yellow"},
				" and must survive on a deserted island. They must build shelters, find food,",
				" and compete in challenges in order to ",
				{"text":"win immunity","color":"green"},
				". The losing tribe must face the ",
				{"text":"Tribal Council","color":"green"},
				" (read the lectern in the cave for more information).",
				{"text":"\\n\\n"},
				"Showcasing this project here is ",
				{"text":"pretty hard","color":"yellow"},
				" because technical features are ",
				{"text":"few","color":"yellow"},
				". I take this opportunity to say that"
				" if you are interested in the concept and speak french, ",
				{"text":"Stoupy51 (or stoupy)","color":"green"},
				" on discord!",
			],
			"billboard": "vertical",
			"alignment": "left",
			"line_width": 275,
			"background": 1962934272,
			"transformation": "{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.0f,0.0f,0.0f],scale:[0.75f,0.75f,0.75f]}"
		},
		"survisland_2": {
			"position": [139, 70.5, -122],
			"text": [
				{"text":CUSTOM_FONTS["survisland_icon"],"color":"white","font":f"{namespace}:text_display"},
			],
			"background": 0,
			"billboard": "vertical",
			"alignment": "center",
		},

		# Python Datapack
		"python_datapack": {
			"position": [127, 74, -127],
			"text": [
				{"text":"","color":"aqua"},
				{"text":"[Python Datapack]\\n","color":"gold"},
				"With the introduction of Minecraft 1.20.5, lots of datapacks were broken.",
				{"text":"\\n"},
				"This is why I created ",
				{"text":"Python Datapack","color":"green"},
				". An open-source tool with the objective to make the creation of ",
				{"text":"extensive","color":"yellow"},
				" datapacks easier and faster through sort-of ",
				{"text":"data-driven","color":"yellow"},
				" development.",
				{"text":"\\n"},
				"Put textures in a folder, define items/blocks and recipes in a python file, and run the script to generate the datapack.",
				{"text":"\\n\\n"},
				"Python Datapack is brought to you as a ",
				{"text":"Python package","color":"yellow"},
				" and a ",
				{"text":"Template","color":"yellow"},
				". It includes a lot of features (see the word cloud on your right), tutorials, and examples.",
				{"text":"\\n\\n"},
				{"text":"At this date, every single project of mine is made with Python Datapack (like SimplEnergy, Switch minigames, Survisland), including this booth!","color":"green"},
				{"text":"\\n\\n"},
				"The most impressive in my opinion is the automatic generation of an interactive in-game manual, get one by moving close to this text display!",
			],
			"billboard": "fixed",
			"alignment": "left",
			"line_width": 275,
			"background": 1962934272,
			"Rotation": [90.0, 0.0],
			"transformation": "{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.5f,0.5f,0.0f],scale:[0.55f,0.55f,0.55f]}"
		},

		# SimplEnergy
		"simplenergy": {
			"position": [120, 70, -127],
			"text": [
				{"text":"","color":"aqua"},
				{"text":"[SimplEnergy]\\n","color":"gold"},
				"This is a simple technology datapack that adds an energy system.",
				{"text":"\\n"},
				"Players can generate energy, store it, and use it to power machines.",
				{"text":"\\n\\n"},
				"You may have seen the ",
				{"text":"Mechanization","color":"green"},
				" booth (made by ICY) around spawn, it is fully compatible with SimplEnergy as we use the same energy system brought by ",
				{"text":"Datapack Energy","color":"green"},
				"."
			],
			"billboard": "vertical",
			"alignment": "left",
			"line_width": 200,
			"background": 1962934272,
			"transformation": "{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.5f,0.0f,0.0f],scale:[0.6f,0.6f,0.6f]}"
		},
		"simplenergy_icon": {
			"position": [120, 69.5, -127],
			"text": [
				{"text":CUSTOM_FONTS["simplenergy_icon"],"color":"white","font":f"{namespace}:text_display"},
			],
			"background": 0,
			"billboard": "vertical",
			"alignment": "center",
			"transformation": "{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.46f,0.0f,0.0f],scale:[1.0f,1.0f,1.0f]}"
		},
	}

	# Add the text displays
	for entity_id, data in TEXT_DISPLAYS.items():
		data = data.copy()
		x, y, z = data.pop("position")
		text = json.dumps(data.pop("text"))
		remaining_string: str = ""
		if len(data) > 0:
			if "Rotation" in data:
				pitch, yaw = data.pop("Rotation")
				remaining_string += f", Rotation:[{pitch}f,{yaw}f]"
			if "transformation" in data:
				remaining_string += f', transformation:{data.pop("transformation")}'
			remaining_string += ", "					# Add the comma
			remaining_string += json.dumps(data)[1:-1]	# Remove the curly brackets

		# Write in load file the kill and summon commands
		write_to_load_file(config, f"""
# Display the text "{entity_id}"
summon text_display {x} {y} {z} {{"Tags":["{namespace}.{entity_id}", "{namespace}"],"text":'{text}'{remaining_string}}}
""")
	
	# Remaining text displays
	word_cloud: dict = database["word_cloud"]
	word_cloud_background: int = database["word_cloud_background"]["custom_model_data"]
	write_to_load_file(config, f"""
# Remaining text displays
function {namespace}:minigolf/display
summon item_display 124 75 -124 {{Rotation:[-45.0f,0.0f],transformation:{{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.0f,-0.25f,0.0f],scale:[2.0f,2.0f,0.5f]}},Tags:["{namespace}.word_cloud","{namespace}"],item:{{id:"{word_cloud["id"]}",components:{{"minecraft:custom_model_data":{word_cloud["custom_model_data"]}}}}}}}
summon item_display 124 75 -124 {{Rotation:[-45.0f,0.0f],transformation:{{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.0f,-0.25f,0.0f],scale:[2.0f,2.0f,0.1f]}},Tags:["{namespace}.word_cloud_background","{namespace}"],item:{{id:"{word_cloud["id"]}",components:{{"minecraft:custom_model_data":{word_cloud_background}}}}}}}
""")
	
	# Add convention tags to the entities
	for tag in CONVENTION_TAGS:
		write_to_load_file(config, f"tag @e[tag={namespace}] add {tag}\n")

	pass

