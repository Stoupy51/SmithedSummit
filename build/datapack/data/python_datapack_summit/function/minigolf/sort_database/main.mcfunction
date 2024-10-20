
#> python_datapack_summit:minigolf/sort_database/main
#
# @within	python_datapack_summit:minigolf/register_score
#

# Copy the database
data modify storage python_datapack_summit:minigolf ranking_copy set from storage python_datapack_summit:minigolf ranking

# Sort the database
data modify storage python_datapack_summit:minigolf sorted set value []
function python_datapack_summit:minigolf/sort_database/while_loop

# Save the sorted database
data modify storage python_datapack_summit:minigolf ranking set from storage python_datapack_summit:minigolf sorted

# Display the database
function python_datapack_summit:minigolf/display

