
#> python_datapack_summit:minigolf/sort_database/main
#
# @within	python_datapack_summit:minigolf/register_score
#

# Remove invalid scores
data remove storage python_datapack_summit:minigolf ranking[{time_str:"0.0"}]
data remove storage python_datapack_summit:minigolf ranking[{time:0.0d}]
data remove storage python_datapack_summit:minigolf ranking[{score:0}]

# Copy the database
data modify storage python_datapack_summit:minigolf ranking_copy set from storage python_datapack_summit:minigolf ranking

# Sort the database
data modify storage python_datapack_summit:minigolf sorted set value []
function python_datapack_summit:minigolf/sort_database/while_loop

# Save the sorted database
data modify storage python_datapack_summit:minigolf ranking set from storage python_datapack_summit:minigolf sorted

# Display the database
function python_datapack_summit:minigolf/display

