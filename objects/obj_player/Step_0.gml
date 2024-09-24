/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_released(vk_tab)) global.debug = !global.debug;

player_control();

shooting_action();



if(keyboard_check_released(ord("H"))) player_looses_life();

checking_if_player_has_shield_active();
	
	
reset_spring_effect(.3);

white_effect_countdown();


if(keyboard_check_released(vk_backspace)) room_restart();
