/// @description Insert description here
// You can write your code in this editor
waves = [seq_wave1, seq_wave2, seq_wave3, seq_wave4, seq_wave5];

waves2 = [seq_wave1_3, seq_wave2_3];

alarm[0] = 300;

alarm[3] = 100;

alarm[1] = 640;

current_wave = 0;

waves_active = true;

current_wave2 = 0;

waves_active2 = true;


//BOSS
alarm[2] = game_get_speed(gamespeed_fps) * 155;
// quando criar as ondas

