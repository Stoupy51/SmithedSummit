
# Imports
from python_datapack.utils.io import *

# Constants
CONVENTION_TAGS: list[str] = ["smithed.entity","smithed.strict","global.ignore","global.ignore.strict"]
CUSTOM_FONTS: dict[str,str] = {
	"icon": r"\u1000",
}

# Main function to place the text displays
def main(config: dict) -> None:
	namespace: str = config["namespace"]
	assets_folder: str = config["assets_folder"]

	# Make the fonts
	write_to_file(f"{config['build_resource_pack']}/assets/{namespace}/font/text_display.json", super_json_dump({
		"providers": [
			{"type":"bitmap","file":"python_datapack_summit:text_display/icon.png","ascent":10,"height":64,"chars":[CUSTOM_FONTS["icon"]]}
		]
	}).replace("\\\\", "\\"))
	super_copy(f"{assets_folder}/original_icon.png", f"{config['build_resource_pack']}/assets/{namespace}/textures/text_display/icon.png")

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
		},
		"welcoming_2": {
			"position": [119, 76.5, -118],
			"text": [
				{"text":CUSTOM_FONTS["icon"],"color":"white","font":f"{namespace}:text_display"},
			],
			"background": 0,
			"billboard": "vertical",
		},

		# How to obtain the booth stamp
		"how_to_obtain_stamp": {
			"position": [125, 74, -118],
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
				{"text":" and find the cave entrance. You need to complete the "},
				{"text":"mini-golf course","color":"green"},
				{"text":" to obtain the stamp."},
			],
			"billboard": "vertical",
			"alignment": "left",
			"line_width": 150,
			"background": 1962934272,
		},

		# Switch minigames
		"switch_minigames_1": {
			"position": [120, 80, -127],
			"text": [
				{"text":"","color":"aqua"},
				"Switch minigames is a ",
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
kill @e[tag={namespace}.{entity_id},tag={namespace}]
summon text_display {x} {y} {z} {{"Tags":["{namespace}.{entity_id}", "{namespace}"],"text":'{text}'{remaining_string}}}
""")
	
	# Add convention tags to the entities
	for tag in CONVENTION_TAGS:
		write_to_load_file(config, f"tag @e[tag={namespace}] add {tag}\n")

	pass

