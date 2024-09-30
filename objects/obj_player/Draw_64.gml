/// @description Insert description here
// You can write your code in this editor




if(global.transition_is_in_progress) exit;

var _gui_height = display_get_gui_height();

drawing_icons(spr_gui_escudo, player_shields, _gui_height -50);

drawing_icons(spr_gui_vida, player_lives, _gui_height -20);