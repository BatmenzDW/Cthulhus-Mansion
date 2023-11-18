/// @description Insert description here
// You can write your code in this editor

sees_player = false
chasing = false
return_patrol = false
walk_speed = 3
start_dash_cooldown = 50
max_dash_cooldown = 50
dash_cooldown = 0
cooldown_decrease = 2
start_dash_duration = 10
max_dash_duration = 10
dash_duration = 0
duration_increase = 3

facing_angle = 0

player_target = {x: 0, y: 0}

path = pth_cultist

path_start(path, walk_speed, path_action_restart, true);

vision = instance_create_layer(x, y, 0, obj_vision_cone, {x: x, y: y})

vision.sight_cone.length = 1000