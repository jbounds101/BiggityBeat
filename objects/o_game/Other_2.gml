audio_group_load(ag_music);
audio_group_load(ag_effects);

randomize()

audio_master_gain(1);
audio_group_set_gain(ag_effects, 0.1, 0);
audio_group_set_gain(ag_music, 1, 0);

window_center();

//room_goto_next();