/// @description Insert description here
// You can write your code in this editor
instance_destroy();
sound(snd_powerupgone, 0.1, 1);
instance_create_layer(x, y, "particles", obj_player_destroyed);
