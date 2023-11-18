/// @description Insert description here
// You can write your code in this editor

sees_player = false
chasing = false
running = false
moving = true
return_patrol = false

max_dash_cooldown = start_dash_cooldown
dash_cooldown = 0

max_dash_duration = start_dash_duration
dash_duration = 0

memory_duration = 0

facing_angle = 0

player_target = {x: 0, y: 0}

path_target = noone
path_i = 0

vision = instance_create_layer(x, y, "Instances", obj_vision_cone, {x: x, y: y})

vision.sight_cone.length = 1500