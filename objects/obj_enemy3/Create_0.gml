/// @description Insert description here
// You can write your code in this editor
life = 10; 

state = "comming";

timer = 0;


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
			
			if(y < 160)
			{
				vspeed = 1.5;
			}
			else
			{
				state = "loading_shot"; //show_debug_message("cheguei");
			}
		}
		// acabei o case
		break;
		
		case "loading_shot":
		{
			vspeed = 0;
			
			shot_timer++;
			
			if (shot_timer >= shot_cooldown)
			{
				state = choose("shooting_type_a", "shooting_type_b");
			}
			hunting_player();
						
		}
		
		break;
		
		case "shooting_type_a":
		{
			if (instance_exists(obj_player))
			{
				timer+= 1;
			
				if (shot_timer >= shot_cooldown)
				{
					
					var _shot = instance_create_layer(x + 10, y, "shots", obj_enemy3_shot);
					var _shot_2 = instance_create_layer(x -10, y, "shots", obj_enemy3_shot);
			
					var _shots_direction = point_direction(x, y, obj_player.x, obj_player.y);

				    // Define a velocidade do projétil
				     _shot.vspeed = +4;
					 _shot.direction = _shots_direction;
					 _shot.image_angle = _shots_direction + 90;
			 
				    // Define a velocidade do projétil
				     _shot_2.vspeed = +4;
					 _shot_2.direction = _shots_direction;
					 _shot_2.image_angle = _shots_direction + 90;
			 
				 
					 shot_timer = 0;
					 
					 if(timer < 3)
					 {
						state = "loading_shot";
					 }
					 else
					 {
						state = "fleeing"; 
					 }
					 
					 }
			 
					 hunting_player();
			}
		}
		
		break;
		
		case "shooting_type_b":
		{
			if (instance_exists(obj_player))
			{
			
				if (shot_timer >= shot_cooldown)
				{
					var _ang = 255
					timer+= 1;
					
					repeat(3)
					{
						
							
					
						var _shot = instance_create_layer(x, y, "shots", obj_enemy3_shotB);
					
						_shot.speed = 4;
						_shot.direction = _ang;
						_shot.image_angle = _shot.direction + 90;
					
						_ang += 15;
					
					
					
						shot_timer = 0;
						
						if(timer < 3)
						 {
							state = "loading_shot";
						 }
						 else
						 {
							state = "fleeing"; 
						 }
					}
				}
			 
				 hunting_player();
			}
		}
		
		break;
		
		case "fleeing":
		{
			vspeed = -1;
			
			if(y < -30)
			{
				instance_destroy();
			}
		}
		
		break;
	}
}

dying = function()
{
	spring_effect(1.5, .5);
	white_effect_timer(2);
	sound(snd_enemy3_hit, .4);
	
	if(life > 1)
	{
		life--;
	}
	else
	{
		instance_destroy();
		instance_create_layer(x,y, "particles", obj_enemy_explosion);
		audio_play_sound(snd_enemy3_explosion, 1, 0, 1);
		screen_shake(20);
	}
	
	

}

// se o inimigo está em uma sequencia
sequence_spawned = in_sequence;