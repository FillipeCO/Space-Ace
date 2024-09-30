/// @description Insert description here
// You can write your code in this editor
instance_destroy();

powerup_types();
//other.player_gain_powerup_level();

global.powerup_text_type = type;


create_powerup_text();


var _particle = instance_create_layer(x, y, layer, obj_shot_particle);

sound(snd_shot_powerup, 0.2);

//mudando o angulo
_particle.image_angle = random(359);