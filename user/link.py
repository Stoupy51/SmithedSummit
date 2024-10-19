
# Imports
from python_datapack.utils.io import *
from python_datapack.constants import OFFICIAL_LIBS
from user.links.text_displays import main as text_displays_main
from user.links.setblocks import main as setblocks_main
from user.links.advancements import main as advancements_main
from user.links.minigolf import main as minigolf_main

# Main function is run just before making finalyzing the build process (zip, headers, lang, ...)
def main(config: dict) -> None:
	namespace: str = config["namespace"]

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

	# Run the other links
	text_displays_main(config)
	setblocks_main(config)
	advancements_main(config)
	minigolf_main(config)
	pass

