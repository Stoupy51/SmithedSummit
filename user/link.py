
# Imports
from python_datapack.utils.io import *
from python_datapack.constants import OFFICIAL_LIBS
from user.links.text_displays import main as text_displays_main
from user.links.setblocks import main as setblocks_main
from user.links.advancements import main as advancements_main
from user.links.minigolf import main as minigolf_main
from user.links.simplenergy import main as simplenergy_main

# Main function is run just before making finalyzing the build process (zip, headers, lang, ...)
def main(config: dict) -> None:
	namespace: str = config["namespace"]
	version: str = config["version"]

	# Remove clocks
	for clock in ["tick","tick_2","second","second_5","minute"]:
		delete_files(f"/{clock}")
	
	# Remove items storage
	write_to_load_file(config, f"""
# If the chunks are not loaded, schedule in 10s and return
scoreboard players set #zone_loaded python_datapack_summit.data 1
execute unless loaded 128 69 -128 run scoreboard players set #zone_loaded python_datapack_summit.data 0
execute unless loaded 128 69 -129 run scoreboard players set #zone_loaded python_datapack_summit.data 0
execute unless loaded 127 100 -129 run scoreboard players set #zone_loaded python_datapack_summit.data 0
execute unless loaded 127 100 -128 run scoreboard players set #zone_loaded python_datapack_summit.data 0
execute if score #zone_loaded python_datapack_summit.data matches 0 run schedule function python_datapack_summit:v{version}/load/confirm_load 10s
execute if score #zone_loaded python_datapack_summit.data matches 0 run return 1

# Load the datapack
tellraw @a[tag=convention.debug] {{"text":"[Loaded PythonDatapackSummit v1.0.0]","color":"green"}}
scoreboard players set #{namespace}.loaded load.status 1

# New objectives
scoreboard objectives add {namespace}.block_interaction_range dummy
scoreboard objectives add {namespace}.minigolf_time dummy

# Remove the previous entities
kill @e[tag={namespace}]

# Summon bananier
summon sheep 137 61 -128 {{Rotation:[-18.0f,-9.0f],Silent:1b,Invulnerable:1b,DeathLootTable:"empty",NoAI:1b,Color:15b,CustomName:'"Bananier"',Tags:["{namespace}.bananier","{namespace}","smithed.entity","smithed.strict","global.ignore","global.ignore.strict"]}}
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

	# Run the other links
	simplenergy_main(config)
	text_displays_main(config)
	setblocks_main(config)
	advancements_main(config)
	minigolf_main(config)
	pass

