
# Imports
from python_datapack.utils.io import *

# Main function to place the text displays
def main(config: dict) -> None:
	database: dict[str, dict] = config["database"]
	namespace: str = config["namespace"]
	assets_folder: str = config["assets_folder"]

	# Place the electric brewing stand
	electric_brewing_stand: dict = database["electric_brewing_stand"]
	write_to_load_file(config, f"""
# Place the electric brewing stand
setblock 123 69 -123 air
summon item_display 123 69.5 -123 {{item:{{id:"{electric_brewing_stand["id"]}",count:1,components:{{"minecraft:custom_model_data":{electric_brewing_stand["custom_model_data"]}}}}},Tags:["{namespace}.electric_brewing_stand","{namespace}"],Rotation:[180.0f,0.0f],transformation:{{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.0f,0.01f,0.0f],scale:[1.002f,1.025f,1.002f]}}}}
setblock 123 69 -123 brewing_stand{{Lock:"uwu"}}

# More setblocks
fill 119 69 -131 120 69 -131 air
fill 115 69 -122 114 69 -122 air
setblock 120 68 -131 air
setblock 120 68 -131 furnace[facing=south,lit=true]{{Lock:"uwu"}}
setblock 119 68 -131 air
setblock 119 68 -131 furnace[facing=south,lit=false]{{Lock:"uwu"}}
setblock 115 68 -122 air
setblock 115 68 -122 furnace[facing=north,lit=true]{{Lock:"uwu"}}
setblock 114 68 -122 air
setblock 114 68 -122 barrel[facing=north,open=false]{{Lock:"uwu"}}
fill 119 69 -131 120 69 -131 rail[shape=east_west]
fill 115 69 -122 114 69 -122 rail[shape=east_west]
""")
	
	# Replace the stiched_texture item model by the proper one
	model_path: str = f"{config['build_resource_pack']}/assets/{namespace}/models/item/stiched_texture.json"
	delete_file(model_path)
	new_model: str = f"{assets_folder}/simplenergy_blocks.json"
	with open(new_model, "r") as file:
		model: dict = json.load(file)
	model["textures"]["27"] = f"{namespace}:item/stiched_texture"
	write_to_file(model_path, super_json_dump(model))

	# Place the blocks
	stiched_texture: dict = database["stiched_texture"]
	write_to_load_file(config, f"""
# Place the blocks
summon item_display 117.0 76 -128.0 {{item:{{id:"{stiched_texture["id"]}",count:1,components:{{"minecraft:custom_model_data":{stiched_texture["custom_model_data"]}}}}},Tags:["{namespace}.stiched_texture","{namespace}"],transformation:{{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.0f,0.01f,0.0f],scale:[16.000f,16.000f,16.000f]}}}}
""")

	pass

