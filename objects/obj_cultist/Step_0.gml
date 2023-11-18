/// @description Insert description here
// You can write your code in this editor

vision.x = x
vision.y = y

vision.sight_cone.left = (30 + facing_angle)
vision.sight_cone.right = (-30 + facing_angle)

facing_angle = (facing_angle + 360) % 360

if (facing_angle <= 90 || facing_angle > 270)
{
	image_xscale = -1
}
else
{
	image_xscale = 1
}

var _player = instance_nearest(x, y, obj_player);

if running && moving
{
	sprite_index = spr_cultist_run
}
else if moving
{
	sprite_index = spr_cultist_walk
}
else
{
	//sprite_index = spr_cultist_wait
}

if return_patrol
{
	var _node = instance_nearest(x, y, obj_node);
	mp_potential_step(_node.x, _node.y, walk_speed, true)
	if distance_to_point(_node.x, _node.y) < walk_speed
	{
		return_patrol = false
		path_target = _node
	}
}

if !chasing
{
	moving = true
	running = false
	mp_potential_step(path_target.x, path_target.y, walk_speed, false)
	if distance_to_point(path_target.x, path_target.y) < walk_speed
	{
		path_i = (path_i + 1)%(array_length(obj_game.path_nodes))
		path_target = obj_game.path_nodes[path_i]
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
			moving = true
			if (dash_duration >= max_dash_duration)
			{
				dash_duration = 0
				max_dash_duration += duration_increase
				dash_cooldown = max_dash_cooldown
				if max_dash_cooldown > 0
					max_dash_cooldown -= cooldown_decrease
					
				if max_dash_duration >= duration_run
					running = true
				else
					running = false
				if (sees_player)
				{
					player_target.x = _player.x
					player_target.y = _player.y
				}
				if (!sees_player && memory_duration >= max_memory_duration)
				{
					memory_duration = 0
					vision.color = c_white
					chasing = false
					return_patrol = true
				}
				else if (!sees_player)
				{
					memory_duration += 1
				}
			}
			else
			{
				mp_potential_step(player_target.x, player_target.y, chase_speed, false)
				dash_duration += 1
			}
		}
		else
		{
			dash_cooldown -= 1
			moving = false
		}
	}
	else
	{
		var _dir = point_direction(vision.x, vision.y, path_target.x, path_target.y)
		var _diff = angle_difference(_dir, facing_angle)
		facing_angle += _diff * 0.01
	}
	
}