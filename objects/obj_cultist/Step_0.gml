/// @description Insert description here
// You can write your code in this editor

vision.x = x
vision.y = y

vision.sight_cone.left = (vision_width/2 + facing_angle)
vision.sight_cone.right = (-vision_width/2 + facing_angle)

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

if distance_to_object(_player) < 5 && _player.is_hidden && saw_hiding
{
	found_player = true
	obj_player.game_over = true
	obj_player.is_hidden = false
	obj_player.x = obj_hiding_spot.stor_x
	obj_player.y = obj_hiding_spot.stor_y
	obj_player.image_alpha = 1;
	if obj_hiding_spot.sprite != noone
		obj_hiding_spot.sprite_index = obj_hiding_spot.sprite
}

if found_player
{
	sprite_index = open_sprite
}
else if running && moving
{
	sprite_index = run_sprite
}
else if moving
{
	sprite_index = walk_sprite
}
else
{
	sprite_index = idle_sprite
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
		if array_length(obj_game.path_nodes) != 0
		{
			path_i = (path_i + 1)%(array_length(obj_game.path_nodes))
			path_target = obj_game.path_nodes[path_i]
		}
	}
}

if instance_exists(_player)
{
	vision.sight_cone.x1 = x + lengthdir_x(vision.sight_cone.length, vision.sight_cone.right);
	vision.sight_cone.y1 = y + lengthdir_y(vision.sight_cone.length, vision.sight_cone.right);
	vision.sight_cone.x2 = x + lengthdir_x(vision.sight_cone.length, vision.sight_cone.left);
	vision.sight_cone.y2 = y + lengthdir_y(vision.sight_cone.length, vision.sight_cone.left);
	if point_in_triangle(_player.center.x, _player.center.y, vision.x, vision.y, vision.sight_cone.x1, vision.sight_cone.y1,
				vision.sight_cone.x2, vision.sight_cone.y2) && !_player.is_hidden
	{
		sees_player = true;
		if _player.start_hiding
			saw_hiding = true
	}
	else
	{
		if !saw_hiding
			sees_player = false;
	}
	
	if (sees_player && !chasing)
	{
		max_dash_cooldown = start_dash_cooldown
		max_dash_duration = start_dash_duration
		chase_speed = start_chase_speed
		chasing = true
		obj_filter_film.intensity += scareyness
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
				chase_speed	+= speed_increase
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
					obj_filter_film.intensity -= scareyness
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
		try
		{
			var _dir = point_direction(vision.x, vision.y, path_target.x, path_target.y)
			var _diff = angle_difference(_dir, facing_angle)
			facing_angle += _diff * 0.01
		}
		catch (_er)
		{
			var _dir = point_direction(vision.x, vision.y, 0, 0)
			var _diff = angle_difference(_dir, facing_angle)
			facing_angle += _diff * 0.01
		}
	}
	
}