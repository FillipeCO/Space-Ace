/// @description Inimigos 2
// You can write your code in this editor
if(!waves_active) exit;

layer_sequence_create("sequence_enemies1",0, 0, waves2[current_wave2])

alarm[3] = 120;


if(current_wave2 < array_length(waves2) -1)
{
	current_wave2++;
	
}
else
{
	current_wave2 = 0;
	
}