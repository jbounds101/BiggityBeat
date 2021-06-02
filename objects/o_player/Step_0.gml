if hitpoints <= 0
{
	room_goto(r_scores);
	var volume_ = audio_sound_get_gain(music);
	audio_sound_gain(music, volume_/2, 10);
}


if alarm[0] == 20 and alarm[1] <= 0 and alarm[2] <= 0
{
	alarm[2] = 60;
	hitpoints -= 1;
	global.score_multiplier = 1;
	audio_play_sound(choose(so_miss1, so_miss2, so_miss3, so_miss4), 40, false);	
}




if (o_input.right and not place_meeting(x+16, y, o_hud))
or (o_input.down and not place_meeting(x, y+16, o_hud))
or (o_input.left and not place_meeting(x-16, y, o_hud))
or (o_input.up and not place_meeting(x, y-16, o_hud))
{
	if o_input.right x += 32;
	if o_input.down y += 32;
	if o_input.left x -= 32;
	if o_input.up y -= 32;

	if not (alarm[0] <= 10) and not (alarm[0] >= 20) or not (alarm[1] <= 0)
	{
		// Too soon or late or tried to move multiple times too quickly
		alarm[2] = 60;
		hitpoints -= 1;
		global.score_multiplier = 1;
		audio_play_sound(choose(so_miss1, so_miss2, so_miss3, so_miss4), 40, false);
	}
	else
	{
		var sound_ = audio_play_sound(choose(so_move1, so_move2, so_move3, so_move4), 40, false);
		audio_sound_set_track_position(sound_, 0.2);
	}

	alarm[1] = 26;

	
//	var sound_ = audio_play_sound(choose(so_miss1, so_miss2, so_miss3, so_miss4), 40, false);
	
}

//show_debug_message(hitpoints);
