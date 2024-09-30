/// @description Insert description here
// You can write your code in this editor


var _position = random_range(20, 250)


sound(snd_missile, 0.3, 0.2);
instance_create_layer(_position, y + 40, "boss_shots", obj_water_torrent);

alarm[3] = 60;

