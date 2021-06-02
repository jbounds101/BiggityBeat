if room != r_menu exit;

var ds_grid = menu_pages[page];
var ds_height = ds_grid_height(ds_grid);
var change_input = o_input.down - o_input.up;

if not started_music
{
	audio_play_sound(so_main_menu, 50, true);
	started_music = true;
}

if inputting
{
	switch(ds_grid[# 1, menu_option[page]]) 
	{
		case menu_element_type.shift:
			var h_input = o_input.right - o_input.left;
			if h_input != 0
			{
				// Audio change value
				ds_grid[# 3, menu_option[page]] += h_input;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, array_length_1d(ds_grid[# 4, menu_option[page]])-1);
			}
		break;
		case menu_element_type.slider:
			switch(menu_option[page])
			{
				case 1: if (!audio_is_playing(so_move4)){ audio_play_sound(so_move4, 70, false); } break;
			}
		
		
		
			var h_input = o_input.right_held - o_input.left_held;
			if h_input != 0
			{
				// Careful audio
				ds_grid[# 3, menu_option[page]] += h_input*0.01;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
				script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]);
			}
		break;
		case menu_element_type.toggle:
			var h_input = o_input.right - o_input.left;
			if h_input != 0
			{
				// Audio change value
				ds_grid[# 3, menu_option[page]] += h_input;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
			}
		break;
		case menu_element_type.input:
			var kk = keyboard_lastkey;
			if kk != vk_enter
			and kk != vk_escape
			and kk != vk_backspace
			{
				ds_grid[# 3, menu_option[page]] = kk;
				variable_instance_set(id, ds_grid[# 2, menu_option[page]], kk);		
				keyboard_unset_map();
				keyboard_set_map(vk_right, right_key);
				keyboard_set_map(vk_left, left_key);
				keyboard_set_map(vk_up, up_key);
				keyboard_set_map(vk_down, down_key);
			}
		
			break;
	}
}
else
{
	if change_input != 0
	{
		menu_option[page] += change_input;
		if menu_option[page] > (ds_height-1) { menu_option[page] = 0; }
		if menu_option[page] < 0 { menu_option[page] = ds_height-1; }
	
	}
}

if o_input.enter
{
	var sound = audio_play_sound(so_move2, 70, false);
	audio_sound_set_track_position(sound, 0.2);
	switch(ds_grid[# 1, menu_option[page]]) 
	{
		case menu_element_type.script_run: script_execute(ds_grid[# 2, menu_option[page]]); break;
	    case menu_element_type.page_transfer: page = ds_grid[# 2, menu_option[page]]; break;	
		case menu_element_type.shift:
		case menu_element_type.slider:
		case menu_element_type.toggle: if (inputting){ script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]); }
		case menu_element_type.input:
			inputting = !inputting;
			
			break;
	}
}