/// @description Insert description here
// You can write your code in this editor
obj_player.is_hidden = true;
obj_player.can_move = false;
stor_x = obj_player.x
stor_y = obj_player.y
obj_player.x = self.x;
obj_player.y = self.y;
obj_player.image_alpha = 0;
show_debug_message("you are hidden")
obj_player.start_hiding = false