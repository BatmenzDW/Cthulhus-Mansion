/// @description Insert description here
// You can write your code in this editor



intensity = 0.5
actual_intensity = 0.5
filter_layer = layer_create(-100, "Film");

filter = fx_create("_filter_old_film");
layer_set_fx(filter_layer, filter);

set_filter = function(_intensity)
{
	if _intensity == 0
		_intensity = obj_filter_film.intensity
		
	var _params = {
	// [0, 1]
	g_OldFilmFlickerIntensity: obj_filter_film.flicker_intensity * _intensity,
	// [0, 30]
	g_OldFilmFlickerSpeed: obj_filter_film.flicker_speed * _intensity,
	// [0, 64]
	g_OldFilmJitterIntensity: obj_filter_film.jitter_intensity * _intensity,
	// [0, 1]
	g_OldFilmSaturation: obj_filter_film.saturation * 1/_intensity,
	// [0, 1]
	g_OldFilmSpeckIntensity: obj_filter_film.speck_intensity * _intensity,
	// (0, 16]
	g_OldFilmBarScale: obj_filter_film.bar_scale * _intensity,
	// [0, 30]
	g_OldFilmBarSpeed: obj_filter_film.bar_speed * _intensity,
	// [2, 128]
	g_OldFilmBarFrequency: obj_filter_film.bar_frequency * 1/_intensity,
	// (0, 16]
	g_OldFilmRingScale: obj_filter_film.ring_scale * _intensity,
	// [1, 256]
	g_OldFilmRingSharpness: obj_filter_film.ring_sharpness * _intensity,
	// [0, 1]
	g_OldFilmRingIntensity: obj_filter_film.ring_intensity * _intensity
	}
	fx_set_parameters(obj_filter_film.filter, _params);
}

set_filter(intensity)