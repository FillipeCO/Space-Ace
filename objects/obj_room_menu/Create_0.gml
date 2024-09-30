/// @description Insert description here
// You can write your code in this editor
menu = ["Play", "Tutorial", "Quit"];

current = 0;

margin = 20;

menu_control = function()
{
	if (keyboard_check_pressed(ord("S")))
	{
		current++;
		sound(snd_zap, 0.2, 0.5);
		margin = 0;
	}

	if (keyboard_check_pressed(ord("W")))
	{
		current--;
		sound(snd_zap, 0.2, 0.5);
		margin = 0;
	}

	current = clamp(current, 0, array_length(menu) -1);

	margin = lerp(margin, 30, 0.1);
	
	if (keyboard_check_pressed(vk_enter))
	{
		menu_buttons();
		sound(snd_menu_option_select, 0.1, 1);
	}
}

menu_buttons = function()
{
	switch(current)
	{
		case 0:
		layer_sequence_create("transition", room_width / 2, room_height / 2, seq_transition);
		global.destiny = rm_game;
		global.transition_is_in_progress = true;
		
		break;
		
		case 1:
		layer_sequence_create("transition", room_width / 2, room_height / 2, seq_transition);
		global.destiny = rm_tutorial;
		global.transition_is_in_progress = true;
		
		break;
		
		case 2:
		game_end();
		
		break;
	}		
}

draw_menu = function()
{
	
	draw_set_valign(1);
	
	var _height_screen_middle = display_get_gui_height() / 2;

	draw_set_font(fnt_menu);

	var _font_height = string_height("I");

	for (var _i = 0; _i < array_length(menu); _i++)
	{
		var _color = c_white;
		var _margin = 0;
	
		if(_i == current)
		{
			_color = c_red;

			_margin = margin;
		}
	
		draw_set_color(_color);
		draw_text(20 + _margin, _height_screen_middle + _i * _font_height * 1.2 - 100, menu[_i]);
		draw_set_color(-1);
	
	}


	draw_set_font(-1);
	draw_set_valign(0);
}