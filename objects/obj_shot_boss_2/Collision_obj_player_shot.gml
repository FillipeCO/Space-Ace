/// @description Insert description here
// You can write your code in this editor
instance_destroy();

sound(snd_enemy1_explosion, 0.3, 1.5);
instance_create_layer( x, y, "particles", obj_enemy_explosion);