/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
alarm[0] = 10;

alarm[1] = 180;

alarm[2] = 160;

life = 500; 
state = "comming";

timer = 0;
shot_cooldown = game_get_speed(gamespeed_fps) * 0.5;
shot_timer = 0;


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
            
            // Incrementa o shot_timer se não estiver na sequencia
            if(!in_sequence) shot_timer++;
            
            if (shot_timer >= shot_cooldown)
            {
                // Reseta o shot_timer e escolhe o próximo tipo de disparo
                shot_timer = 0;
                state = choose("shooting_type_a", "shooting_type_b");
            }
        }
        break;
        
        case "shooting_type_a":
        {
            if (instance_exists(obj_player))
            {
                shot_timer++;

                if (shot_timer >= shot_cooldown)
                {
                    // Cria os projéteis direcionados ao jogador
					sound(snd_boss_shot, 0.2, 0.1);
                    var _shot = instance_create_layer(x, y + 40, "boss_shots", obj_shot_boss);

                    var _shots_direction = point_direction(x, y, obj_player.x, obj_player.y);
                    _shot.vspeed = 5;
                    _shot.direction = _shots_direction;
                    _shot.image_angle = _shots_direction + 90;

                    // Reseta o shot_timer após disparar
                    shot_timer = 0;

                    // Aumenta o timer de disparos
                    timer++;

                    // Se o inimigo tiver disparado menos de 3 vezes, volta para "loading_shot"
                    if (timer < 3)
                    {
                        state = "loading_shot";
                    }
                    else
                    {
                        // Reinicia o timer e continua atirando
                        timer = 0;
                    }
                }
            }
        }
        break;
        
        case "shooting_type_b":
        {
            if (instance_exists(obj_player))
            {
                shot_timer++;

                if (shot_timer >= shot_cooldown)
                {
                    // Calcula a direção central em direção ao jogador
					var _center_direction = point_direction(x, y, obj_player.x, obj_player.y);

					// Define o ângulo de espalhamento (por exemplo, 15 graus de diferença entre cada tiro)
					var _spread = 15;
					var _shots_count = 3; // Número de tiros

					// Inicia o ângulo de disparo no primeiro tiro
					var _ang = _center_direction - ((_shots_count - 1) * _spread) / 2;

					// Reproduz o som do tiro
					sound(snd_boss_shot, 0.2, 0.1);

					// Dispara os tiros com espalhamento
					repeat(_shots_count)
					{
					    var _shot = instance_create_layer(x, y + 40, "boss_shots", obj_shot_boss);
	
					    _shot.speed = 5;
					    _shot.direction = _ang;

					    // Aumenta o ângulo para o próximo tiro
					    _ang += _spread;
					}

                    // Reseta o shot_timer após disparar
                    shot_timer = 0;

                    // Aumenta o timer de disparos
                    timer++;

                    // Se o inimigo tiver disparado menos de 3 vezes, volta para "loading_shot"
                    if (timer < 3)
                    {
                        state = "loading_shot";
                    }
                    else
                    {
                        // Reinicia o timer e continua atirando
                        timer = 0;
                    }
                }
            }
        }
        break;
    }
}


dying = function()
{
	spring_effect(1, 0.9);
	white_effect_timer(2);
	sound(snd_enemy3_hit, 0.2, 0.5);
	
	if(life > 1)
	{
		life--;
	}
	else
	{
		instance_destroy();
		global.boss_destroyed = true;
		global.points += 500;
		layer_sequence_create("sequence_boss", 0, 0, seq_boss_destroyed);
		audio_play_sound(snd_enemy3_explosion, 1, 0, 1);
		screen_shake(20);
		global.destiny = rm_game_2;
		
		with(obj_player)
		{
			alarm[3] = 360;
		}
	}
	
	

}
