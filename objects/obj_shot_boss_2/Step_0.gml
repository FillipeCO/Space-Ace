/// @description Insert description here
// You can write your code in this editor
if (y > room_height + 30)
        {
            instance_destroy();
        }
		
if(instance_exists(obj_player))
{
	
	var _player_dir = point_direction(x, y, obj_player.x, obj_player.y);
	direction = _player_dir;
	image_angle = obj_player.image_angle;
}

