/// @description Insert description here
// You can write your code in this editor




param_value = param_min_value;
exiting = true;
temp_layer = layer_create(-10000);
filter = fx_create(filter_name);
layer_set_fx(temp_layer, filter);
fx_set_parameter(filter, param_name, param_value);