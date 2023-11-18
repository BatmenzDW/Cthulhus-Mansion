/// @description Insert description here
// You can write your code in this editor




for (var _i = 0; _i < instance_number(obj_node); _i++;)
{
	path_nodes[_i] = instance_find(obj_node, _i)
}

// Initialise Viewports
view_enabled = true;
view_visible[0] = true;

view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = 960 * 4;
view_hport[0] = 540 * 4;

view_camera[0] = camera_create_view(obj_player.x, obj_player.y, view_wport[0], view_hport[0], 0, noone, -1, -1, -1, -1);

var _dwidth = display_get_width();
var _dheight = display_get_height();
var _xpos = (_dwidth / 2) - 480;
var _ypos = (_dheight / 2) - 270;

window_set_rectangle(_xpos, _ypos, 960, 540);

surface_resize(application_surface, 960, 540);