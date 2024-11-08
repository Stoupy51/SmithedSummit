
# Imports
from python_datapack.utils.io import *

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
	advancements_path: str = f"{config['build_datapack']}/data/{namespace}/advancement"


	# Advancement when entering the booth
	enter_booth: dict = json.loads(json.dumps(BASE_ADVANCEMENT))
	enter_booth["rewards"]["function"] = f"{namespace}:advancements/enter_booth"
	write_to_file(f"{advancements_path}/enter_booth.json", super_json_dump(enter_booth, max_level=-1))
	write_to_function(config, f"{namespace}:advancements/enter_booth", f"""
# Revoke exit booth advancement and a temporary tag
advancement revoke @s only {namespace}:exit_booth
tag @s add {namespace}.in_booth

# Ignore non-adventure players
execute unless entity @s[gamemode=adventure] run return 1

# Remember previous block_interaction_range
execute store result score @s {namespace}.block_interaction_range run attribute @s block_interaction_range base get 100

# Modify block_interaction_range (to allow interaction with the lecterns and signs)
attribute @s block_interaction_range base set 4.5
""")


	# Advancement when exiting the booth
	exit_booth: dict = json.loads(json.dumps(BASE_ADVANCEMENT))
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
# Revoke enter booth advancement, get manual advancement, and the temporary tag
advancement revoke @s only {namespace}:enter_booth
advancement revoke @s only {namespace}:manual
tag @s remove {namespace}.in_booth

# If riding a golf ball, exit it
execute on vehicle if entity @s[tag=golf_ball.base] on passengers if entity @s[type=player] run function golf_ball:ball/exit_player

# Ignore non-adventure players
execute unless entity @s[gamemode=adventure] run return 1

# Clear some items
clear @s *[custom_data~{{"{namespace}":{{"clear_on_exit":true}}}}]

# Modify block_interaction_range back to default
data modify storage {namespace}:main input set value {{"value":0.0}}
execute store result storage {namespace}:main input.value double 0.01 run scoreboard players get @s {namespace}.block_interaction_range
function {namespace}:advancements/exit_booth_modify_range with storage {namespace}:main input
""")
	write_to_function(config, f"{namespace}:advancements/exit_booth_modify_range", f"$attribute @s block_interaction_range base set $(value)")


	# Inventory changed advancement in the booth
	inventory_changed: dict = json.loads(json.dumps(BASE_ADVANCEMENT))
	inventory_changed["criteria"]["requirement"]["trigger"] = "minecraft:inventory_changed"
	inventory_changed["rewards"]["function"] = f"{namespace}:advancements/inventory_changed"
	write_to_file(f"{advancements_path}/inventory_changed.json", super_json_dump(inventory_changed, max_level=-1))
	write_to_function(config, f"{namespace}:advancements/inventory_changed", f"""
# Revoke advancement
advancement revoke @s only {namespace}:inventory_changed

# If the player has the pendant, grant the booth stamp
scoreboard players set #nb_pendants {namespace}.data 0
execute store result score #nb_pendants {namespace}.data if items entity @s container.* *[custom_data~{{{namespace}:{{pendant:1b}}}}]
execute if score #nb_pendants {namespace}.data matches 1.. run advancement grant @s only smithed_passport:visit_booth/python_datapack

# If more than 1 pendant, clear them
execute if score #nb_pendants {namespace}.data matches 2.. run clear @s *[custom_data~{{{namespace}:{{pendant:1b}}}}] 1
""")
	
	# Give a manual to the player
	manual: dict = json.loads(json.dumps(BASE_ADVANCEMENT))
	manual["criteria"]["requirement"]["conditions"]["player"][0]["predicate"]["location"]["position"] = {
		"x": {"min": 124,	"max": 127},
		"y": {"min": 72,	"max": 76},
		"z": {"min": -128,	"max": -125},
	}
	manual["rewards"] = {"loot": [f"{namespace}:i/manual"]}
	write_to_file(f"{advancements_path}/manual.json", super_json_dump(manual, max_level=-1))

	pass

