
# Imports
from python_datapack.utils.io import *

# Main function to place the text displays
def main(config: dict) -> None:

	# Write in load file the kill and summon commands
	write_to_load_file(config, """
# Remove the previous lecterns and signs
setblock 119 74 -131 air
setblock 119 80 -129 air
setblock 119 80 -124 air
setblock 133 62 -122 air

# Set the lecterns
setblock 119 74 -131 lectern[facing=south,has_book=true,powered=false]{Book:{components:{"minecraft:written_book_content":{author:"Stoupy51",pages:[{raw:'"[Booth Plan]\\n\\n- Floor 1:\\nPython Datapack explanation\\n- Floor 2:\\nSwitch minigames\\n- Floor -1:\\nSimplEnergy showcase\\n- Garden and cave:\\nSurvisland\\n- Deep cave:\\nMinigolf course\\n"'}],resolved:1b,title:{raw:"Booth Plan"}}},count:1,id:"minecraft:written_book"},Page:0}

# Set the signs
setblock 119 80 -129 oak_sign[rotation=1]{front_text:{color:"blue",has_glowing_text:1b,messages:['""','{"clickEvent":{"action":"run_command","value":"/tellraw @s {\\"text\\":\\"Join the Switch minigames discord by clicking here!\\",\\"color\\":\\"blue\\",\\"clickEvent\\":{\\"action\\":\\"open_url\\",\\"value\\":\\"https://discord.com/anxzu6rA9F\\"}}"},"color":"blue","text":"Join the discord"}','{"color":"blue","text":"server here","clickEvent":{"action":"run_command","value":"/playsound ui.button.click"}}','""']},is_waxed:1b}
setblock 119 80 -124 oak_sign[rotation=7]{front_text:{color:"red",has_glowing_text:1b,messages:['""','{"clickEvent":{"action":"run_command","value":"/tellraw @s {\\"text\\":\\"Watch Switch Memories by clicking here!\\",\\"color\\":\\"red\\",\\"clickEvent\\":{\\"action\\":\\"open_url\\",\\"value\\":\\"https://www.youtube.com/watch?v=cB27sEOxboA\\"}}"},"color":"red","text":"Watch the short"}','{"color":"red","text":"video here","clickEvent":{"action":"run_command","value":"/playsound ui.button.click"}}','""']},is_waxed:1b}
setblock 133 62 -122 spruce_wall_sign[facing=south]{front_text:{messages:['{"text":"[Mini-Golf]","color":"aqua"}','{"text":"Start the course","color":"yellow"}','{"text":"by clicking here","color":"yellow","clickEvent":{"action":"run_command","value":"/function python_datapack_summit:minigolf/start"}}','{"text":""}']}} replace
""".replace("\\","\\\\"))

	pass

