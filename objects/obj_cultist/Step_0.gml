/// @description Insert description here
// You can write your code in this editor

vision.x = x
vision.y = y

vision.sight_cone.left = (30 + facing_angle)
vision.sight_cone.right = (-30 + facing_angle)

if (facing_angle > 90 && facing_angle <= 270)
{
	image_xscale = 1
}
else
{
	image_xscale = -1
}

var _player = instance_nearest(x, y, obj_player);

if return_patrol
{
	var _x = path_get_x(pth_cultist, 0)
	var _y = path_get_y(pth_cultist, 0)
	mp_potential_step(_x, _y, walk_speed, true)
	if distance_to_point(_x, _y) < walk_speed
	{
		return_patrol = false
		path_start(path, walk_speed, path_action_restart, true);
	}
}

if instance_exists(_player)
{
	vision.sight_cone.x1 = x + lengthdir_x(vision.sight_cone.length, vision.sight_cone.right);
	vision.sight_cone.y1 = y + lengthdir_y(vision.sight_cone.length, vision.sight_cone.right);
	vision.sight_cone.x2 = x + lengthdir_x(vision.sight_cone.length, vision.sight_cone.left);
	vision.sight_cone.y2 = y + lengthdir_y(vision.sight_cone.length, vision.sight_cone.left);
	if point_in_triangle(_player.center.x, _player.center.y, vision.x, vision.y, vision.sight_cone.x1, vision.sight_cone.y1,
				vision.sight_cone.x2, vision.sight_cone.y2)
	{
		sees_player = true;
	}
	else
	{
		sees_player = false;
	}
	
	if (sees_player && !chasing)
	{
		max_dash_cooldown = start_dash_cooldown
		max_dash_duration = start_dash_duration
		chasing = true
		vision.color = c_red
		path_end()
		player_target.x = _player.x
		player_target.y = _player.y
		var _dir = point_direction(vision.x, vision.y, player_target.x, player_target.y)
		var _diff = angle_difference(_dir, facing_angle)
		facing_angle += _diff * 0.9
	}
	if (chasing)
	{
		if (dash_cooldown <= 0)
		{
			if (dash_duration >= max_dash_duration)
			{
				dash_duration = 0
				max_dash_duration += duration_increase
				dash_cooldown = max_dash_cooldown
				if max_dash_cooldown > 0
					max_dash_cooldown -= cooldown_decrease
				player_target.x = _player.x
				player_target.y = _player.y
				if (!sees_player)
				{
					vision.color = c_white
					chasing = false
					return_patrol = true
				}
			}
			else
			{
				mp_potential_step(player_target.x, player_target.y, 5, true)
				dash_duration += 1
			}
		}
		else
		{
			dash_cooldown -= 1
		}
		var _dir = point_direction(vision.x, vision.y, player_target.x, player_target.y)
		var _diff = angle_difference(_dir, facing_angle)
		facing_angle += _diff * 0.9
	}
	else
	{
		facing_angle += 0.5
	}
	
}