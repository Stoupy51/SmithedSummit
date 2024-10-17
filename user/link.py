
# Imports
from python_datapack.utils.io import *
from python_datapack.constants import OFFICIAL_LIBS
from user.links.text_displays import main as text_displays_main

# Main function is run just before making finalyzing the build process (zip, headers, lang, ...)
def main(config: dict) -> None:
	namespace: str = config["namespace"]
	version: str = config["version"]

	# Remove clocks
	for clock in ["tick","tick_2","second","second_5","minute"]:
		delete_files(f"/{clock}")
	
	# Remove items storage
	write_to_load_file(config, """
tellraw @a[tag=convention.debug] {"text":"[Loaded PythonDatapackSummit v1.0.0]","color":"green"}
scoreboard players set #python_datapack_summit.loaded load.status 1
""", True)

	# Disable lots of libraries
	for lib in OFFICIAL_LIBS:
		if lib != "smithed.custom_block":
			OFFICIAL_LIBS[lib]["is_used"] = False
			delete_files(lib)

	# Delete all recipes and functionnal libraries calls
	delete_files("recipe")
	delete_files("function/calls")
	delete_files("simpledrawer")

	# Summon text displays
	text_displays_main(config)

	pass

