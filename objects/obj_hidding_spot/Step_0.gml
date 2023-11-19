/// @description Checking for collisions
// You can write your code in this editor





if(place_meeting(x,y,obj_player) && !(obj_player.is_hidden)) {
	if(keyboard_check_pressed(ord("G"))) {
		obj_player.can_move = false;
		alarm_set(0,interact_delay);
		obj_player.start_hiding = true
	}
	if(keyboard_check_released(ord("G")))
	{
		obj_player.can_move = true;	
		alarm_set(0,-1);
		obj_player.start_hiding = false
	}
}
if(obj_player.is_hidden && keyboard_check_pressed(ord("G"))) {
	obj_player.is_hidden = false;
	obj_player.can_move = true;
	obj_player.image_alpha = 1;
	show_debug_message("un hidden")
	obj_player.x = stor_x
	obj_player.y = stor_y
}
