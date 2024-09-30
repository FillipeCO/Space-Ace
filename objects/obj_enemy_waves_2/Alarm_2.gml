/// @description BOSS
// You can write your code in this editor
layer_sequence_create("sequence_boss",0, 0, seq_boss_2);
audio_stop_all();

waves_active = false;

with(obj_enemy1)
{
	dying();
}

with(obj_enemy2)
{
	dying();
}

with(obj_enemy3)
{
	dies();
}