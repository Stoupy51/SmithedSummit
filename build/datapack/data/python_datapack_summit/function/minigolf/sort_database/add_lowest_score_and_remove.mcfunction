
#> python_datapack_summit:minigolf/sort_database/add_lowest_score_and_remove
#
# @within	python_datapack_summit:minigolf/sort_database/while_loop with storage python_datapack_summit:minigolf sort_input
#

# Add the lowest score to the sorted database
$data modify storage python_datapack_summit:minigolf sorted append from storage python_datapack_summit:minigolf ranking_copy[$(index)]

# Remove the lowest score from the ranking copy
$data remove storage python_datapack_summit:minigolf ranking_copy[$(index)]

