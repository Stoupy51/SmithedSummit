
# Imports
from python_datapack.utils.io import *
from python_datapack.constants import OFFICIAL_LIBS
from user.links.text_displays import main as text_displays_main
from user.links.setblocks import main as setblocks_main

# Constants
BOOTH_LOCATION: tuple[list[int], list[int]] = ([107, 53, -134], [162, 107, -115])
BASE_ADVANCEMENT: dict = {
	"criteria": {
		"requirement": {
			"trigger": "minecraft:location",
			"conditions": {
				"player": [
					{
						"condition": "minecraft:entity_properties",
						"entity": "this",
						"predicate": {
							"location": {
								"position": {
									"x": {
										"min": BOOTH_LOCATION[0][0],
										"max": BOOTH_LOCATION[1][0]
									},
									"y": {
										"min": BOOTH_LOCATION[0][1],
										"max": BOOTH_LOCATION[1][1]
									},
									"z": {
										"min": BOOTH_LOCATION[0][2],
										"max": BOOTH_LOCATION[1][2]
									},
								}
							}
						}
					}
				]
			}
		}
	},
	"rewards": {
		"function": "none"
	}
}


# Main function is run just before making finalyzing the build process (zip, headers, lang, ...)
def main(config: dict) -> None:
	namespace: str = config["namespace"]
	version: str = config["version"]
	advancements_path: str = f"{config['build_datapack']}/data/{namespace}/advancement"

	# Remove clocks
	for clock in ["tick","tick_2","second","second_5","minute"]:
		delete_files(f"/{clock}")
	
	# Remove items storage
	write_to_load_file(config, f"""
tellraw @a[tag=convention.debug] {{"text":"[Loaded PythonDatapackSummit v1.0.0]","color":"green"}}
scoreboard players set #{namespace}.loaded load.status 1

# New objectives
scoreboard objectives add {namespace}.block_interaction_range dummy
""", True)

	# Disable every libraries
	for lib in OFFICIAL_LIBS:
		OFFICIAL_LIBS[lib]["is_used"] = False
		delete_files(lib)

	# Delete all recipes and functionnal libraries calls
	delete_files("recipe")
	delete_files("function/calls")
	delete_files("custom_blocks")
	delete_files("simpledrawer")

	# Summon text displays and setblock lecterns and signs
	text_displays_main(config)
	setblocks_main(config)
	
	# Advancement when entering the booth
	enter_booth: dict = BASE_ADVANCEMENT.copy()
	enter_booth["rewards"]["function"] = f"{namespace}:advancements/enter_booth"
	write_to_file(f"{advancements_path}/enter_booth.json", super_json_dump(enter_booth, max_level=-1))
	write_to_function(config, f"{namespace}:advancements/enter_booth", f"""
# Revoke exit booth advancement and a temporary tag
advancement revoke @s only {namespace}:exit_booth
tag @s add {namespace}.in_booth

# Ignore non-adventure players
execute unless entity @s[gamemode=adventure] run return 1

# Remember previous player.block_interaction_range
execute store result score @s {namespace}.block_interaction_range run attribute @s player.block_interaction_range base get 100

# Modify player.block_interaction_range (to allow interaction with the lecterns and signs)
attribute @s player.block_interaction_range base set 4.5
""")
	
	# Advancement when exiting the booth
	exit_booth: dict = BASE_ADVANCEMENT.copy()
	first_player_condition: dict = exit_booth["criteria"]["requirement"]["conditions"]["player"][0].copy()
	exit_booth["rewards"]["function"] = f"{namespace}:advancements/exit_booth"
	exit_booth["criteria"]["requirement"]["conditions"]["player"][0]["term"] = first_player_condition.copy()
	exit_booth["criteria"]["requirement"]["conditions"]["player"].append(first_player_condition.copy())
	exit_booth["criteria"]["requirement"]["conditions"]["player"][1]["predicate"] = {"nbt": f"{{Tags:[\"{namespace}.in_booth\"]}}"}
	exit_booth["criteria"]["requirement"]["conditions"]["player"][0]["condition"] = "minecraft:inverted"
	del exit_booth["criteria"]["requirement"]["conditions"]["player"][0]["predicate"]
	del exit_booth["criteria"]["requirement"]["conditions"]["player"][0]["entity"]
	write_to_file(f"{advancements_path}/exit_booth.json", super_json_dump(exit_booth, max_level=-1))
	write_to_function(config, f"{namespace}:advancements/exit_booth", f"""
# Revoke enter booth advancement and the temporary tag
advancement revoke @s only {namespace}:enter_booth
tag @s remove {namespace}.in_booth

# Ignore non-adventure players
execute unless entity @s[gamemode=adventure] run return 1

# Clear some items
clear @s *[custom_data~{{"{namespace}":{{"clear_on_exit":true}}}}]

# Modify player.block_interaction_range back to default
data modify storage {namespace}:main input set value {{"value":0.0}}
execute store result storage {namespace}:main input.value double 0.01 run scoreboard players get @s {namespace}.block_interaction_range
function {namespace}:advancements/exit_booth_modify_range with storage {namespace}:main input
""")
	write_to_function(config, f"{namespace}:advancements/exit_booth_modify_range", f"$attribute @s player.block_interaction_range base set $(value)")

	pass

