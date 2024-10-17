
# Imports
from python_datapack.utils.io import *
from python_datapack.constants import OFFICIAL_LIBS

# Main function is run just before making finalyzing the build process (zip, headers, lang, ...)
def main(config: dict) -> None:
	namespace: str = config["namespace"]
	version: str = config["version"]
	build_datapack: str = config['build_datapack']
	functions_folder: str = f"{build_datapack}/data/{namespace}/function"

	# Remove clocks
	for clock in ["tick","tick_2","second","second_5","minute"]:
		delete_file(f"{functions_folder}/v{version}/{clock}.mcfunction", True)
	
	# Remove items storage
	write_to_load_file(config, """
tellraw @a[tag=convention.debug] {"translate":"python_datapack_summit.loaded_pythondatapacksummit_v1_0_0","color":"green"}
scoreboard players set #python_datapack_summit.loaded load.status 1
""", True)

	# Disable lots of libraries
	for lib in OFFICIAL_LIBS:
		if lib != "smithed.custom_block":
			OFFICIAL_LIBS[lib]["is_used"] = False

	# Delete all recipes and functionnal libraries calls
	delete_files(f"{namespace}/recipe")
	delete_files("function/calls")
	delete_files("common_signals")


	pass

