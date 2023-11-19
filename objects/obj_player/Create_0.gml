/// @description Insert description here
// You can write your code in this editor

can_move = true
is_moving = false
is_hidden = false
start_hiding = false
player_speed = 10
coll_list = [obj_wall, obj_furniture]
game_over = false
game_win = false
target_door = {x: 0, y: 0}

center = {x: x + sprite_get_width(spr_player) / 2, y: y + sprite_get_height(spr_player) / 2}