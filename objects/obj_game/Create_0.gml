/// @description Insert description here
// You can write your code in this editor

path_nodes = []

amulet_completed = false
amulet_pieces = []

new_piece = noone

game_over = false

get_amulet_piece = function(_piece_id, _array)
{
	array_push(_array, _piece_id)
	amulet_completed = array_length(_array) >= 5
}

was_collected = function(_piece_id, _array)
{
	return array_contains(_array, _piece_id)
}