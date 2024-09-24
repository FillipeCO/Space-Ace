/// @description Insert description here
// You can write your code in this editor
// criando primeira onda
layer_sequence_create("sequence_enemies1",0, 0, waves[current_wave])

alarm[0] = 320;



if(current_wave < array_length(waves) -1)
{
	current_wave++;
}