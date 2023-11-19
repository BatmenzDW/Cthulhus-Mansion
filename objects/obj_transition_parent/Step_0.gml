/// @description Insert description here
// You can write your code in this editor




if (exiting)
{
        param_value += param_speed;
        if (param_value >= param_max_value)
        {
			room_goto(target_room);
        }
}
else
{
        param_value += -param_speed;
        if (param_value <= param_min_value)
        {
			instance_destroy();
        }
}
fx_set_parameter(filter, param_name, param_value);