/// @description Insert description here
// You can write your code in this editor


if(!waves_active) exit;

layer_sequence_create("sequence_enemies1",0, 0, waves[current_wave])

alarm[5] = 90;


if(current_wave < array_length(waves) -1)
{
	current_wave++;
	
}
else
{
	current_wave = 0;
}