
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
			{"type":"bitmap","file":"python_datapack_summit:text_display/icon.png","ascent":0,"height":40,"chars":[CUSTOM_FONTS["icon"]]}
		]
	}).replace("\\\\", "\\"))
	super_copy(f"{assets_folder}/original_icon.png", f"{config['build_resource_pack']}/assets/{namespace}/textures/text_display/icon.png")

	# Text displays
	TEXT_DISPLAYS: dict = {
		"welcoming": {
			"position": [119, 75, -117],
			"text": [
				{"text":"Welcome to the Python Datapack Booth!\n","color":"gold"},
				{"text":CUSTOM_FONTS["icon"],"color":"white","font":f"{namespace}:text_display"},
			],
		},
	}

	# Add the text displays
	for entity_id, data in TEXT_DISPLAYS.items():
		x, y, z = data["position"]
		text = json.dumps(data["text"])

		# Write in load file the kill and summon commands
		summon_tags: list[str] = [f"{namespace}.{entity_id}", namespace] + CONVENTION_TAGS
		write_to_load_file(config, f"""
# Display the text "{entity_id}"
kill @e[tag={namespace}.{entity_id},tag={namespace}]
summon text_display {x} {y} {z} {{"Tags":{summon_tags},"text":'{text}'}}
""")

	pass

