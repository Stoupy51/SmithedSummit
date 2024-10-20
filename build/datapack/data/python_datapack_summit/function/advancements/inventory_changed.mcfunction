
#> python_datapack_summit:advancements/inventory_changed
#
# @within	advancement python_datapack_summit:inventory_changed
#

# Revoke advancement
advancement revoke @s only python_datapack_summit:inventory_changed

# If the player has the pendant, grant the booth stamp
scoreboard players set #nb_pendants python_datapack_summit.data 0
execute store result score #nb_pendants python_datapack_summit.data if items entity @s container.* *[custom_data~{python_datapack_summit:{pendant:1b}}]
execute if score #nb_pendants python_datapack_summit.data matches 1.. run advancement grant @s only smithed_passport:visit_booth/python_datapack

# If more than 1 pendant, clear them
execute if score #nb_pendants python_datapack_summit.data matches 2.. run clear @s *[custom_data~{python_datapack_summit:{pendant:1b}}] 1

