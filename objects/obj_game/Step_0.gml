/// @description Insert description here
// You can write your code in this editor

if hear_boss_music
{
	if headstart > 0
	{
		headstart -= 1
	}
	else if headstart > -1
	{
		boss_follow(obj_clifford)
		headstart = -1
	}
}

if (obj_player.game_over) {
	obj_game.persistent = false;
	obj_player.persistent = false;
	room_goto(rm_game_over)
}
else if obj_player.game_win
{
	obj_game.persistent = false;
	obj_player.persistent = false;
	room_goto(rm_main_menu)
}
if amulet_completed
{
	var _br = instance_number(obj_furniture_barrier)

	for (var _i = 0; _i < _br; ++_i)
	{	
		var _inst = instance_find(obj_furniture_barrier, _i)
		if _inst.trans_x != 0 || _inst.trans_x != 0
		{
			_inst.x += _inst.trans_x
			_inst.y += _inst.trans_y
			
			_inst.trans_x = 0
			_inst.trans_y = 0
		}
	}
}