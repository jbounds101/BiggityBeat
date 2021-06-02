counter += 1;

if counter == 7
{
	alarm[1] = 22;
	skip_beat = true;
	if not color_chosen
	{
		color = make_color_hsv(irandom_range(0, 255), irandom_range(60, 255), irandom_range(60, 255));
		color_chosen = true;
	}
	
	counter = -1;
}
else
{
	skip_beat = false;
	color_chosen = false;
}

alarm[0] = 30;

//////////////

if debug
{
	// Debugging purposes only
	
	debug_counter += 1;
	switch (debug_counter) 
	{
	    case 1:
	       x += 32;
	        break;
		case 2:
	       y += 32;
	        break;
		case 3:
	       x -= 32;
	        break;
		case 4:
	       y -= 32;
	        break;
	}	
	if debug_counter == 4
	{
		debug_counter = 0;	
	}
	var sound_ = audio_play_sound(choose(so_move1, so_move2, so_move3, so_move4), 40, false);
	audio_sound_set_track_position(sound_, 0.2);
	alarm[1] = 26;
}

//////////////