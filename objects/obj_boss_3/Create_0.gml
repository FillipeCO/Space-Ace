/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor

waves = [seq_wave1_3, seq_wave2_3];

current_wave = 0;

waves_active = true;

alarm[0] = 10;

alarm[1] = 180;

alarm[5] = 180;

life = 500; 

state = "comming";

timer = 0;

laser_initialized = false;

laser_shot = noone;

waves_active = true;


shot_cooldown = game_get_speed(gamespeed_fps) * 2;
shot_timer = 0;

hunting_player = function()
{
	if (instance_exists(obj_player))
	{

		var _player_location = obj_player.x;
			
		if(x > _player_location)
		{
			hspeed = -0.5;
		}
		if(x < _player_location)
		{
			hspeed = 0.5;
		}
		if (x == _player_location)
		{
			hspeed = 0;
		}
		
	}
	else hspeed = 0;

}

begin_spring_effect();
begin_white_effect();

// state machine
state_machine = function()
{
    //switch
    switch(state)
    {        
        case "comming":
        {
            if (y < 100)
            {
				screen_shake(20);
				state = "loading_shot"; // chegou na posição de combate
			}

        }
        break;
        
        case "loading_shot":
        {
            vspeed = 0;

			hunting_player();
            
            // Incrementa o shot_timer se não estiver na sequencia
            if(!in_sequence) shot_timer++;
			
			// Define o frame da animação para 1 enquanto carrega o tiro

            
            if (shot_timer >= shot_cooldown)
            {
                // Reseta o shot_timer e escolhe o próximo tipo de disparo
                shot_timer = 0;
                state = choose("shooting_type_laser");
            }
        }
        break;
		
		case "shooting_type_laser":
{
    if (instance_exists(obj_player))
    {
		hspeed = 0;
		image_index = 2;
		image_speed = 0;

        // Configuração inicial do tiro laser
        if (laser_shot == noone)
        {


			laser_shot = instance_create_layer(x, y, "boss_laser_layer", obj_boss_shot_3);

			laser_shot.image_xscale = 0.3
            laser_shot.image_yscale = 0.1; // Começa pequeno
            laser_shot_speed = 0.2; // Velocidade de crescimento do laser

            // Tocar som do laser (opcional)
            sound(snd_boss_3_laser, 0, 1);
        }

        // Crescimento do laser (somente se a instância existir)
        if (instance_exists(laser_shot))
        {
            laser_shot.image_yscale += laser_shot_speed;

            // Limitar o crescimento do laser
            if (laser_shot.image_yscale >= 15) // Limite de tamanho do laser
            {
                laser_shot.image_yscale = 15; // Define o limite máximo
                shot_timer = 0;

                // Aumenta o timer de disparos
                timer++;

                // Depois de um tempo atirando, retorna para "loading_shot"
                if (timer >= 3)
                {
                    // Destrói o tiro de laser e volta para o estado de carregamento
                    with (laser_shot) instance_destroy();
                    laser_shot = noone; // Reseta a variável do laser
                    timer = 0;
					
					image_index = 0;
					image_speed = 1;

                    state = "loading_shot";
                }
            }
        }
    }
}
break;

		}
}

dying = function()
{
	spring_effect(1.1, 0.9);
	white_effect_timer(2);
	sound(snd_enemy3_hit, 0.2, 0.5);
	
	if(life > 1)
	{
		life--;
	}
	else
	{
	
		random_powerup_drop();

		global.points += 100;
		waves_active = false;
		instance_destroy();
		instance_create_layer(x,y, "particles", obj_enemy_explosion);
		layer_sequence_create("sequence_boss", 0, 0, seq_boss_destroyed_3);
		audio_play_sound(snd_enemy3_explosion, 1, 0, 1);
		screen_shake(20);
		global.transition_is_in_progress = true;
		
		with(obj_player)
		{
			alarm[4] = 360;
		}
	}
}

// dying para usar com o "with" em outros objetos
dies = function()
{
	random_powerup_drop();

	instance_destroy();
	instance_create_layer(x,y, "particles", obj_enemy_explosion);
	audio_play_sound(snd_enemy3_explosion, 1, 0, 1);
	global.points += 100;
	screen_shake(20);
}

// se o inimigo está em uma sequencia
sequence_spawned = in_sequence;