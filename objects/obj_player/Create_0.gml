vel = 3;

shot_cooldown = 20;

shot_timer = 0;

shot_level = 1;

player_control = function()
{
    var _up, _down, _left, _right, _change, _change2;
    
    // Checando as teclas
    _up = keyboard_check(ord("W")) or keyboard_check(vk_up);
    _down = keyboard_check(ord("S")) or keyboard_check(vk_down);
    _left = keyboard_check(ord("A")) or keyboard_check(vk_left);
    _right = keyboard_check(ord("D")) or keyboard_check(vk_right);
	_change = keyboard_check(ord("R"));
	_change2 = keyboard_check(ord("T"));

    hspeed = 0;
    vspeed = 0;
    
    // Movimentação horizontal
    if (_right) hspeed = vel;
    if (_left) hspeed = -vel;
    
    // Movimentação vertical
    if (_up) vspeed = -vel;
    if (_down) vspeed = vel;
	
	if (_change) shot_level += 1;
	if (_change2) shot_level--;
	

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
	
	if (_shooting and shot_timer <= 0)
    {
        if(shot_level == 1)
		{
			shoot_type1();
		}
		else if (shot_level == 2)
		{
			shoot_type2();
		}
		else if (shot_level == 3)
		{
			shoot_type3();
		}
		
		shot_timer = shot_cooldown;
        
    }
		
}

shoot_type1 = function()
{
    var _shot = instance_create_layer(x, y, "shots", obj_player_shot);

    // Define a velocidade do projétil
     _shot.vspeed = -10;

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
     _shot.vspeed = -10;
	 
	 _shot = instance_create_layer(x + 10, y, "shots", obj_player_shot);
        // Define a velocidade do projétil
     _shot.vspeed = -10;

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
