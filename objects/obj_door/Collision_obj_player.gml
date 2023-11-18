/// @description Insert description here
// You can write your code in this editor

if target_room == noone
{
	return
}

obj_player.target_door.x = target_x
obj_player.target_door.y = target_y

var _transition = instance_create_layer(0, 0, "Instances", obj_transition_linear_blur);
_transition.target_room = target_room