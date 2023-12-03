/// @description Insert description here
// You can write your code in this editor

current_fx = fx_create("_filter_old_film")

path_nodes = []

amulet_completed = false
amulet_pieces = []

new_piece = noone

hear_boss_music = false
visited_rooms = []
headstart = -1
boss_headstart = 500

game_over = false

get_amulet_piece = function(_piece_id, _array)
{
	array_push(_array, _piece_id)
	obj_player.talisman_count += 1
	obj_game.amulet_completed = array_length(_array) >= 5
	
	//obj_player.game_win = amulet_completed
}

was_collected = function(_piece_id, _array)
{
	return array_contains(_array, _piece_id)
}

summon_boss = function(_x, _y, _boss)
{
	instance_create_layer(_x, _y, "Instances", _boss)
}

boss_follow = function(_boss)
{
	instance_create_layer(obj_player.target_door.x, obj_player.target_door.y, "Instances", _boss)
}