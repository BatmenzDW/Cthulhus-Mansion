/// @description Insert description here
// You can write your code in this editor

if (obj_player.game_over) {
	obj_game.persistent = false;
	obj_player.persistent = false;
	room_goto(rm_game_over)
}


