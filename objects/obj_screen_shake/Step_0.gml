/// @description Insert description here
// You can write your code in this editor


// alterando o x e y do viewport com base no valor do shake

if (shake > 0.1)
{
	var _x = random_range(-shake, shake);
	var _y = random_range(-shake, shake);
	
	view_set_xport(view_current, _x)
	view_set_yport(view_current, _y)
}
else // cheguei perto de 0, eu zero o valor do shake
{
	shake = 0;
	
	view_set_xport(view_current, 0);
	view_set_yport(view_current, 0);
}


// diminuindo o valor do shake gradualmente
shake = lerp(shake, 0, 0.1)