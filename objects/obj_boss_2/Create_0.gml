/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
alarm[0] = 10;

alarm[1] = 180;

alarm[2] = 160;

alarm[3] = 200;

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
					sound(snd_torrent, 0.2, 0.1);
                    var _shot = instance_create_layer(x, y + 30, "boss_shots", obj_shot_boss_2);

                    var _shots_direction = point_direction(x, y, obj_player.x, obj_player.y);
                    _shot.vspeed = 3;
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
            // Calcula a direção em direção ao jogador
            var _shots_direction = point_direction(x, y, obj_player.x, obj_player.y);

            // Reproduz o som do tiro
            sound(snd_torrent, 0.2, 0.1);

            // Dispara os tiros de diferentes posições x do inimigo
            var _offsets = [-100, 0, 100]; // Posições de onde os tiros serão disparados, para espalhá-los horizontalmente

            for (var i = 0; i < array_length(_offsets); i++)
            {
                var _shot = instance_create_layer(x + _offsets[i], y + 30, "boss_shots", obj_shot_boss_2);
                
                _shot.vspeed = 3;
                _shot.direction = _shots_direction;
                _shot.image_angle = _shots_direction + 90;
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
		layer_sequence_create("sequence_boss", 0, 0, seq_boss_destroyed_2);
		audio_play_sound(snd_enemy3_explosion, 1, 0, 1);
		screen_shake(20);
		global.destiny = rm_game_3;
		
		with(obj_player)
		{
			alarm[3] = 360;
		}
	}
	
	

}
