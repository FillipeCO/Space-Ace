/// @description Insert description here
// You can write your code in this editor
if (!in_sequence)
{
    // Verifica se a animação está fora do intervalo de 4 a 6
    if (image_index < 4 || image_index > 6)
    {
        image_index = 4;  // Reseta para o início do intervalo
    }
    
    image_speed = 1;  // Define a velocidade da animação normalmente

    // Quando a animação chega ao frame 6, retorna ao 4 para manter o loop
    if (image_index >= 6)
    {
        image_index = 4;
    }
	
}

state_machine();

reset_spring_effect();
white_effect_countdown();
