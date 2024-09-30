/// @description Inimigos 1
// You can write your code in this editor
// criando primeira onda
if(!waves_active) exit;

layer_sequence_create("sequence_enemies1",0, 0, waves[current_wave])

alarm[0] = 160;


if(current_wave < array_length(waves) -1)
{
	current_wave++;
	
}
else
{
	current_wave = 0;
}