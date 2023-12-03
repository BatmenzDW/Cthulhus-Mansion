/// @description Insert description here
// You can write your code in this editor

if random(1) > 0.995 / min(2*obj_filter_film.intensity, 1.25) && !cursed_text
{
	draw_set_font(fnt_cursed)
	cursed_text = true
}
else
{
	if cursed_text && random(1) > min(obj_filter_film.intensity, 0.75)
	{
		draw_set_font(fnt_objective)
		cursed_text = false
	}
}

if obj_game.hear_boss_music
{
	draw_set_color(c_red)
	draw_text(10,10,"Escape")
	draw_set_color(c_white)
}
else if !obj_game.amulet_completed
{
	draw_text(10,10,"Amulet Pieces: " + string(talisman_count) +"/5")
}
else
{
	draw_text(10,10,"Place the amulet in the Pedestal at the top of the stairs")
}

