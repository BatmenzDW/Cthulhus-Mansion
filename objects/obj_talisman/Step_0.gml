/// @description Insert description here
// You can write your code in this editor




if keyboard_check_pressed(ord("F"))
{
	var _player = instance_nearest(x, y, obj_player)
	
	if instance_exists(_player)
	{
		if distance_to_object(_player) < 10
		{
			obj_game.get_amulet_piece(id, obj_game.amulet_pieces)
	
			instance_destroy()
		}
	}
}