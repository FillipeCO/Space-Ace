// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.debug = false;


function getting_destroyed(_particle = obj_shot_particle)
{
	instance_destroy();
	
	instance_create_layer(x,y,"particles", _particle)
	
}

function screen_shake(_shake = 1)
{
	if (instance_exists(obj_screen_shake))
	{
		
		// checando se o valor do shake atual é maior do que o valor do treme do obj_screen_skake
		with(obj_screen_shake)
		// se o novo shake for maior do que o shake que estou tremendo, mudo o valor dele
		if(_shake > shake)
		{
			shake = _shake;
		}

	}
}

function begin_spring_effect()
{
	xscale = 1;
	yscale = 1;
}

function spring_effect(_xscale = 1, _yscale = 1)
{
	xscale = _xscale;
	yscale = _yscale;
}

function reset_spring_effect(_qnt = .1)
{
	xscale = lerp(xscale, 1, _qnt);
	yscale = lerp(yscale, 1, _qnt);
}

function draw_spring_effect()
{
	draw_sprite_ext(sprite_index,
				image_index, 
				x,
				y,
				xscale,
				yscale,
				image_angle,
				image_blend,
				image_alpha);
}

function begin_white_effect()
{
	took_a_hit = false;
}

function white_effect_timer(_time = 1)
{
	took_a_hit = _time;
}

function white_effect_countdown()
{
	if (took_a_hit > 0)
	{
		took_a_hit--;
	}
}

function draw_white_effect(_draw_function = draw_self())
{
	if(took_a_hit)
	{
		shader_set(sh_white);
		_draw_function();
		shader_reset();
	}
	else
	{
		_draw_function();
	}
}

function sound(_sound = snd_player_shot, _variation = .1)
{
	var _pitch = random_range(1- _variation, 1 + _variation);
	
	audio_play_sound(_sound, 0, 0, , , _pitch)
}