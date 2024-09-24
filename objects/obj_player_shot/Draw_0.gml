/// @description Insert description here
// You can write your code in this editor
draw_self();

// efeito de brilho

//mudando a forma como o computador processa as cores
gpu_set_blendmode(bm_add);
// desenhando a sprite novamente, um pouco transparente
draw_sprite_ext(sprite_index,
				image_index, 
				x,
				y,
				image_xscale * 2,
				image_yscale * 2,
				image_angle,
				c_aqua,
				0.2);

gpu_set_blendmode(bm_normal);