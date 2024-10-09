
# Imports
from python_datapack.utils.database_helper import *

# Main function is run just before making finalyzing the build process (zip, headers, lang, ...)
def main(config: dict) -> None:
	namespace: str = config["namespace"]
	version: str = config["version"]
	build_datapack: str = config['build_datapack']
	functions_folder: str = f"{build_datapack}/data/{namespace}/function"

	# Remove clocks
	for clock in ["tick","tick_2","second","second_5","minute"]:
		delete_file(f"{functions_folder}/v{version}/{clock}.mcfunction", True)

	pass

