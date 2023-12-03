/// @description Insert description here
// You can write your code in this editor




if intensity != actual_intensity
{
	actual_intensity += (intensity - actual_intensity) * 0.01
	//show_debug_message("intensity: " + string(actual_intensity))
	set_filter(actual_intensity)
}