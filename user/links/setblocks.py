
# Imports
from python_datapack.utils.io import *

# Main function to place the text displays
def main(config: dict) -> None:
	namespace: str = config["namespace"]

	# Write in load file the kill and summon commands
	write_to_load_file(config, """
# Remove the previous lecterns and signs
setblock 119 74 -131 air
setblock 139 61 -121 air
setblock 127 73 -127 air
setblock 127 73 -126 air
setblock 118 68 -122 air

setblock 126 74 -125 air
setblock 126 74 -128 air
setblock 119 80 -129 air
setblock 119 80 -124 air
setblock 133 62 -122 air

# Set the lecterns
setblock 119 74 -131 lectern[facing=south,has_book=true]{Book:{components:{"minecraft:written_book_content":{author:"",pages:[{raw:'{"color":"#0F5C00","extra":[{"color":"dark_aqua","text":"[Booth Plan]"},"\\n\\n- Floor 1:",{"color":"dark_green","text":"\\nPython Datapack explanation"},"\\n- Floor 2:",{"color":"dark_green","text":"\\nSwitch minigames"},"\\n- Floor -1:",{"color":"dark_green","text":"\\nSimplEnergy showcase"},"\\n- Garden and cave:",{"color":"dark_green","text":"\\nSurvisland"},"\\n- Deep Cave:",{"color":"dark_green","text":"\\nMinigolf course"}],"text":""}'}],resolved:1b,title:{raw:""}}},count:1,id:"minecraft:written_book"},Page:0}
setblock 139 61 -121 lectern[facing=north,has_book=true]{Book:{components:{"minecraft:written_book_content":{author:"Mizanathos",pages:[{raw:'"In Survivor, the American version of the survival show, voting is a central aspect of the game.\\n\\nAt regular intervals, the contestants participate in a Tribal Council, where they vote to eliminate one of their own."'},{raw:'"This usually happens after a tribe has lost an immunity challenge, or once the tribes merge into one group and individual competition begins."'},{raw:'"During Tribal Council:\\n\\nEach contestant writes down the name of another contestant on a slip of paper in secret.\\n\\nThe host collects the votes and reads them aloud one by one."'},{raw:'"The player who receives the most votes is immediately eliminated from the game, often referred to as being \\"voted off the island.\\""'},{raw:'"The vote is heavily strategic. Contestants form alliances, make deals, and sometimes break promises in order to further their own game.\\n\\nThe goal is to stay in the game as long as possible, eventually making it to the Final Tribal Council, "'},{raw:'"where the remaining players face a jury of previously eliminated contestants who then vote for a winner."'}],resolved:1b,title:{raw:"Survivor Votes"}}},count:1,id:"minecraft:written_book"},Page:0}
setblock 127 73 -127 lectern[facing=west,has_book=true]{Book:{components:{"minecraft:written_book_content":{author:"Stoupy51",pages:[{raw:'{"color":"dark_aqua","extra":[{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/SmithedSummit"},"color":"red","text":"\\n\\nThis booth: "},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/SmithedSummit"},"color":"dark_red","text":"[here]"},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/PythonDatapackTemplate"},"color":"red","text":"\\n\\nPython Datapack Template: "},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/PythonDatapackTemplate"},"color":"dark_red","text":"[here]"},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/SimplEnergy"},"color":"red","text":"\\n\\nSimplEnergy: "},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/SimplEnergy"},"color":"dark_red","text":"[here]"},{"clickEvent":{"action":"open_url","value":"https://www.planetminecraft.com/data-pack/simplenergy/"},"color":"gold","text":"\\n[Download datapack]"},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/GolfBall"},"color":"red","text":"\\n\\nGolf Ball: "},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/GolfBall"},"color":"dark_red","text":"[here]"},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/python_datapack"},"text":"\\n\\nPython package: "},{"color":"dark_blue","text":"[here]"}],"text":"[Source codes]"}'}],resolved:1b,title:{raw:""}}},count:1,id:"minecraft:written_book"},Page:0}
setblock 127 73 -126 lectern[facing=west,has_book=true]{Book:{components:{"minecraft:written_book_content":{author:"Stoupy51",pages:[{raw:'{"color":"dark_aqua","extra":[{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/SmithedSummit"},"color":"red","text":"\\n\\nThis booth: "},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/SmithedSummit"},"color":"dark_red","text":"[here]"},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/PythonDatapackTemplate"},"color":"red","text":"\\n\\nPython Datapack Template: "},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/PythonDatapackTemplate"},"color":"dark_red","text":"[here]"},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/SimplEnergy"},"color":"red","text":"\\n\\nSimplEnergy: "},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/SimplEnergy"},"color":"dark_red","text":"[here]"},{"clickEvent":{"action":"open_url","value":"https://www.planetminecraft.com/data-pack/simplenergy/"},"color":"gold","text":"\\n[Download datapack]"},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/GolfBall"},"color":"red","text":"\\n\\nGolf Ball: "},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/GolfBall"},"color":"dark_red","text":"[here]"},{"clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/python_datapack"},"text":"\\n\\nPython package: "},{"color":"dark_blue","text":"[here]"}],"text":"[Source codes]"}'}],resolved:1b,title:{raw:""}}},count:1,id:"minecraft:written_book"},Page:0}
setblock 118 68 -122 lectern[facing=north,has_book=true]{Book:{components:{"minecraft:written_book_content":{author:"Stoupy51",pages:[{raw:'{"color":"dark_aqua","extra":[{"clickEvent":{"action":"open_url","value":"https://www.planetminecraft.com/data-pack/simplenergy/"},"color":"red","text":"\\n\\nSimplEnergy: "},{"clickEvent":{"action":"open_url","value":"https://www.planetminecraft.com/data-pack/simplenergy/"},"color":"dark_red","text":"[here]"},{"clickEvent":{"action":"open_url","value":"https://www.planetminecraft.com/data-pack/mechanization/"},"color":"red","text":"\\n\\nMechanization: "},{"clickEvent":{"action":"open_url","value":"https://www.planetminecraft.com/data-pack/mechanization/"},"color":"dark_red","text":"[here]"},{"clickEvent":{"action":"open_url","value":"https://github.com/ICY105/DatapackEnergy"},"text":"\\n\\nDatapack Energy: "},{"clickEvent":{"action":"open_url","value":"https://github.com/ICY105/DatapackEnergy"},"color":"dark_blue","text":"[here]"}],"text":"[Links]"}'}],resolved:1b,title:{raw:""}}},count:1,id:"minecraft:written_book"},Page:0}

# Set the signs
setblock 126 74 -125 oak_wall_sign[facing=north]{front_text:{color:"blue",has_glowing_text:1b,messages:['""','{"clickEvent":{"action":"run_command","value":"/tellraw @s {\\"text\\":\\"Join the Python Datapack discord by clicking here!\\",\\"color\\":\\"blue\\",\\"clickEvent\\":{\\"action\\":\\"open_url\\",\\"value\\":\\"https://discord.gg/anxzu6rA9F\\"}}"},"color":"blue","text":"Join the discord"}','{"color":"blue","text":"server here","clickEvent":{"action":"run_command","value":"/playsound ui.button.click"}}','""']},is_waxed:1b}
setblock 126 74 -128 oak_wall_sign[facing=south]{front_text:{color:"red",has_glowing_text:1b,messages:['""','{"clickEvent":{"action":"run_command","value":"/tellraw @s {\\"text\\":\\"Open the template page by clicking here!\\",\\"color\\":\\"red\\",\\"clickEvent\\":{\\"action\\":\\"open_url\\",\\"value\\":\\"https://github.com/Stoupy51/PythonDatapackTemplate\\"}}"},"color":"red","text":"Open the template"}','{"color":"red","text":"page here","clickEvent":{"action":"run_command","value":"/playsound ui.button.click"}}','""']},is_waxed:1b}
setblock 119 80 -129 oak_sign[rotation=1]{front_text:{color:"blue",has_glowing_text:1b,messages:['""','{"clickEvent":{"action":"run_command","value":"/tellraw @s {\\"text\\":\\"Join the Switch minigames discord by clicking here!\\",\\"color\\":\\"blue\\",\\"clickEvent\\":{\\"action\\":\\"open_url\\",\\"value\\":\\"https://discord.gg/anxzu6rA9F\\"}}"},"color":"blue","text":"Join the discord"}','{"color":"blue","text":"server here","clickEvent":{"action":"run_command","value":"/playsound ui.button.click"}}','""']},is_waxed:1b}
setblock 119 80 -124 oak_sign[rotation=7]{front_text:{color:"red",has_glowing_text:1b,messages:['""','{"clickEvent":{"action":"run_command","value":"/tellraw @s {\\"text\\":\\"Watch Switch Memories by clicking here!\\",\\"color\\":\\"red\\",\\"clickEvent\\":{\\"action\\":\\"open_url\\",\\"value\\":\\"https://www.youtube.com/watch?v=cB27sEOxboA\\"}}"},"color":"red","text":"Watch the short"}','{"color":"red","text":"video here","clickEvent":{"action":"run_command","value":"/playsound ui.button.click"}}','""']},is_waxed:1b}
setblock 133 62 -122 spruce_wall_sign[facing=south]{front_text:{messages:['{"text":"[Mini-Golf]","color":"aqua"}','{"text":"Start the course","color":"yellow"}','{"text":"by clicking here","color":"yellow","clickEvent":{"action":"run_command","value":"/function python_datapack_summit:minigolf/start"}}','{"text":""}']}} replace
""".replace("\\","\\\\"))

	# Every second, place the hidden pendant
	write_to_versioned_file(config, "second", f"""
execute unless data block 137 69 -131 Items[].components."minecraft:custom_data".{namespace}.pendant run loot insert 137 69 -131 loot python_datapack_summit:i/pendant
""")

	pass

