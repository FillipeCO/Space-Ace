/// @description Insert description here
// You can write your code in this editor
alarm[0] = game_get_speed(gamespeed_fps) * 2;

enemy1_shooting = function()
{
    var _shot = instance_create_layer(x, y, "shots", obj_enemy1_shot);

    // Define a velocidade do projétil
     _shot.vspeed = +3;

    // Verifica todos os tiros existentes na camada "shots"
    with (obj_enemy1_shot)
    {
        // Se o projétil sair da tela, destrua-o
        if (y > room_height + 30)
        {
            instance_destroy();
			show_debug_message("tiro destruido");
        }
    }
}

dying = function()
{
	getting_destroyed(obj_enemy_explosion);
	
	sound(snd_enemy1_explosion, 0.4);
	
	var _drop_chance = random(100);
	
	if(_drop_chance > 1)
	{
		instance_create_layer(x,y,layer,obj_powerup);
	}
}

// se o inimigo está em uma sequencia
sequence_spawned = in_sequence;