/// @description Insert description here
// You can write your code in this editor
vspeed = 0.8;

alarm[0] = game_get_speed(gamespeed_fps) * 8;

alarm[1] = game_get_speed(gamespeed_fps) * 4;

type = "+ Life";


powerup_types = function()
{
	switch(type)
	{
		case "shot_multiply":
		other.player_gain_powerup_level();
		
		break;
		
		case "+ Life":
		other.player_gains_life();
		
		break;
		
	}		
}