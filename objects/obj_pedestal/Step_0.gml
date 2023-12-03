/// @description Insert description here
// You can write your code in this editor




if keyboard_check_pressed(ord("F")) && !obj_game.hear_boss_music
{
	var _player = instance_nearest(x, y, obj_player)
	
	if instance_exists(_player)
	{
		if distance_to_object(_player) < 10
		{
			show_debug_message("pedestal used")
			if obj_game.amulet_completed
			{
				show_debug_message("pedestal completed")
				sprite_index = sprite_completed
				obj_game.hear_boss_music = true
				obj_game.summon_boss(spawn_x, spawn_y, obj_clifford)
				obj_filter_film.intensity += 0.5
			}
		}
	}
}