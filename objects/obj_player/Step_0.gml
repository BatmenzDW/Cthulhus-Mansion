/// @description Insert description here
// You can write your code in this editor


if (keyboard_check(vk_left) || keyboard_check(ord("A")))
{
    x = x - player_speed;
}
if (keyboard_check(vk_right) || keyboard_check(ord("D")))
{
    x = x + player_speed;
}
if (keyboard_check(vk_up) || keyboard_check(ord("W")))
{
    y = y - player_speed;
}
if (keyboard_check(vk_down) || keyboard_check(ord("S")))
{
    y = y + player_speed;
}