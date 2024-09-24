
audio_stop_all();
audio_play_sound(backgound_music, 0, 1, 0.2);

#region variables

vel = 2;

player_lives = 5;

player_shields = 3;

active_player_shields = noone;

shot_cooldown = 15;

shot_timer = 0;

shot_level = 1;

invulnerability_time = game_get_speed(gamespeed_fps);

timer_invulnerability = 0;

begin_white_effect();

begin_spring_effect();


#endregion


#region functions

player_control = function()
{
	timer_invulnerability--;
	
    var _up, _down, _left, _right;
    
    // Checando as teclas
    _up = keyboard_check(ord("W")) or keyboard_check(vk_up);
    _down = keyboard_check(ord("S")) or keyboard_check(vk_down);
    _left = keyboard_check(ord("A")) or keyboard_check(vk_left);
    _right = keyboard_check(ord("D")) or keyboard_check(vk_right);


    hspeed = 0;
    vspeed = 0;
    
    // Movimentação horizontal
    if (_right) hspeed = vel;
    if (_left) hspeed = -vel;
    
    // Movimentação vertical
    if (_up) vspeed = -vel;
    if (_down) vspeed = vel;
	
	if(keyboard_check_released(ord("E"))) player_uses_shield();
	
    // Definindo a direção e velocidade finais
    if (hspeed != 0 or vspeed != 0)
    {
        direction = point_direction(0, 0, hspeed, vspeed);
        speed = vel;
    }
    else
    {
        speed = 0;
    }
	
	x = clamp(x, sprite_width/2, room_width - sprite_width/2)
	
	y = clamp(y, sprite_height/2, room_height - sprite_height/2)
}

shooting_action = function()
{
	 var _shooting = keyboard_check(vk_space) or mouse_check_button(mb_left);
    
    // Reduzindo o tempo do cooldown
    shot_timer--;
	
	var _pitch = random_range(0.8, 1.5);
	
	if (_shooting and shot_timer <= 0)
    {
		spring_effect(0.8, 1.2);
		
        if(shot_level == 1)
		{
			audio_play_sound(snd_player_shot, 1, 0, 0.4, 0, _pitch);
			shoot_type1();
		}
		else if (shot_level == 2)
		{
			repeat(2)
			{
				audio_play_sound(snd_player_shot, 1, 0, 0.4, 0, _pitch);
			}
			shoot_type2();
		}
		else if (shot_level == 3)
		{

				audio_play_sound(snd_player_shot_3, 1, 0, 0.3, 0, _pitch);
			
			shoot_type3();
		}
		
		shot_timer = shot_cooldown;
        
    }
		
}

shoot_type1 = function()
{
    var _shot = instance_create_layer(x, y, "shots", obj_player_shot);

    // Define a velocidade do projétil
     //_shot.vspeed = -10;

    // Verifica todos os tiros existentes na camada "shots"
    with (obj_player_shot)
    {
        // Se o projétil sair da tela, destrua-o
        if (y < -30)
        {
            instance_destroy();
        }
    }
}

shoot_type2 = function()
{
	 var _shot = instance_create_layer(x -10, y, "shots", obj_player_shot);
        // Define a velocidade do projétil
     //_shot.vspeed = -10;
	 
	 _shot = instance_create_layer(x + 10, y, "shots", obj_player_shot);
        // Define a velocidade do projétil
     //_shot.vspeed = -10;

    // Verifica todos os tiros existentes na camada "shots"
    with (obj_player_shot)
    {
        // Se o projétil sair da tela, destrua-o
        if (y < -30)
        {
            instance_destroy();
        }
    }
    	
}

shoot_type3 = function()
{
	shoot_type1();
	shoot_type2()
}

player_gain_powerup_level = function()
{
	if(shot_level < 3) shot_level++;
}

player_looses_life = function()
{
	if(timer_invulnerability > 0) return;
	
		screen_shake(10);
		spring_effect(1.5, 1.2);
		white_effect_timer(3);
		
		if(player_lives > 1)
		{
			player_lives--;
			
			timer_invulnerability = invulnerability_time;
			
		}
		else
		{
			screen_shake(50);
			instance_destroy();
		}	
}

player_uses_shield = function()
{
	
	
	if(player_shields > 0 and active_player_shields = noone)
	{
		player_shields--;
		
		active_player_shields = instance_create_layer(x,y,"shields",obj_player_shield);
	}
}

drawing_icons = function(_icon = spr_gui_vida, _quantity = 1, _y_position = 0)
{

	var _player_lives_xposition = 0;

	repeat(_quantity)
	{
		draw_sprite_ext(_icon, 0, 20 + _player_lives_xposition,  _y_position, 1, 1, 0, c_white, 0.5);
		_player_lives_xposition +=30;
	}

}

checking_if_player_has_shield_active = function()
{
	if(instance_exists(active_player_shields))
	{
		active_player_shields.x = x;
		active_player_shields.y = y;
	}
	else
	{
		active_player_shields = noone;
	}	
}


#endregion