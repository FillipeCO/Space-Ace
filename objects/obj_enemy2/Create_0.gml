/// @description Insert description here
// You can write your code in this editor
alarm[0] = game_get_speed(gamespeed_fps) * 2;

enemy1_shooting = function()
{
    var _shot = instance_create_layer(x, y, "shots", obj_enemy2_shot);
	
	sound(snd_enemy_shot, 0.3, 1);

    // Define a velocidade do projétil
     _shot.vspeed = +3;

    // Verifica todos os tiros existentes na camada "shots"
    with (obj_enemy1_shot)
    {
        // Se o projétil sair da tela, destrua-o
        if (y > room_height + 30)
        {
            instance_destroy();
        }
    }
}

dying = function()
{
	getting_destroyed(obj_enemy_explosion);
	screen_shake(5);
	
	sound(snd_enemy1_explosion, 0.4, 2);
	global.points += 10;
	
	var _drop_chance = random(100);
	
	if(_drop_chance > 99)
	{
		random_powerup_drop();
	}
}

// se o inimigo está em uma sequencia
sequence_spawned = in_sequence;