
//apenas se estiver tendo uma transição
if(global.transition_is_in_progress = true)
{
	layer_sequence_create("transition", room_width / 2, room_height / 2, seq_transition_2);
}

sound(snd_menu_song, 0, 0.2);

global.points = 0;