if room != r_menu exit;

var width = global.view_width;
var height = global.view_height;

draw_set_valign(fa_middle);
draw_set_halign(fa_right);

draw_set_font(f_font);

var ds_grid = menu_pages[page];
var ds_height = ds_grid_height(ds_grid);

var x_buffer = 16;
var y_buffer = 32;

var start_x = width/2;
var start_y = (height/2) - (((ds_height-1)/2) * y_buffer);

var left_text_x = start_x - x_buffer;
var left_text_y

var x_offset = 0;

var yy = 0;
repeat(ds_height)
{
	left_text_y = start_y + (yy*y_buffer);
	
	var c = c_white;
	x_offset = 0;
	if (yy == menu_option[page])
	{
		c = c_yellow;
		x_offset = -(x_buffer/2);
	}
	
	draw_text_color(left_text_x+x_offset, left_text_y, ds_grid[# 0, yy], c,c,c,c, 1);
	yy++;
}

draw_line(start_x, start_y-y_buffer, start_x, left_text_y+y_buffer);




draw_set_halign(fa_left);

var right_text_x = start_x + x_buffer;
var right_text_y;

yy = 0;
repeat(ds_height)
{
	right_text_y = start_y + (yy * y_buffer);
	switch(ds_grid[# 1, yy]) 
	{
	    case menu_element_type.shift: 
			var current_value = ds_grid[# 3, yy];
			var current_array = ds_grid[# 4, yy];
			var left_shift = "<< ";
			var right_shift = " >>";
		
			if (current_value == 0) left_shift = "";
			if (current_value == array_length_1d(ds_grid[# 4, yy])-1) right_shift = "";
		
			c = c_white;
			
			if (inputting and (yy == menu_option[page])) c = c_yellow;
			draw_text_color(right_text_x, right_text_y, left_shift + current_array[current_value] + right_shift, c,c,c,c, 1);
		
		break;
		
		case menu_element_type.slider:
		
			var length = 64;
			var current_value  = ds_grid[# 3, yy];
			var current_array = ds_grid[# 4, yy];
			var circle_position = ((current_value - current_array[0]) / (current_array[1] - current_array[0]));
			c = c_white;
			
			draw_line_width(right_text_x, right_text_y, right_text_x + length, right_text_y, 2);
			
			if (inputting and (yy == menu_option[page])) c = c_yellow;
			draw_circle_color(right_text_x + (circle_position*length), right_text_y, 4, c,c, false);
			draw_text_color(right_text_x + (length * 1.2), right_text_y, string(floor(circle_position*100)) + "%", c,c,c,c, 1);

		break;
		
		case menu_element_type.toggle:
		
			var current_value = ds_grid[# 3, yy];
			var c1, c2;
			c = c_white;
			if (inputting and (yy == menu_option[page])) c = c_yellow;
			
			if (current_value == 0) {c1 = c; c2 = c_dkgray}
			else					{c1 = c_dkgray c2 = c; }
		
			draw_text_color(right_text_x, right_text_y, "ON", c1,c1,c1,c1, 1);
			draw_text_color(right_text_x + 64, right_text_y, "OFF", c2,c2,c2,c2, 1);
			
		break;
		
		case menu_element_type.input:
		
			var current_value = ds_grid[# 3, yy];
			var string_value;
			
			switch(current_value)
			{
				case vk_up: string_value = "UP KEY"; break;
				case vk_left: string_value = "LEFT KEY"; break;
				case vk_down: string_value = "DOWN KEY"; break;
				case vk_right: string_value = "RIGHT KEY"; break;
				default: string_value = chr(current_value); break;
			}
			
			c = c_white;
			if (inputting and (yy == menu_option[page])) c = c_yellow;
			draw_text_color(right_text_x, right_text_y, string_value, c,c,c,c, 1);
		
		break;
		
	}
	
	yy++;
}


draw_set_valign(fa_top);