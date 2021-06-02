var color_value = color_get_value(o_player.color);
var color_ = make_color_hsv(color_get_hue(o_player.color), color_get_saturation(o_player.color), color_value + 50);


for (var i = 0; i < o_player.max_hitpoints; i++)
{
	var _filled = i < o_player.hitpoints;	
	//draw_sprite(s_heart, _filled, 32*i, -1);
	
	if i == o_player.counter
	{
		draw_sprite_ext(s_heart, _filled, 32*i, -2, 1, 1, 0, color_, 1);
	}
	else
	{
		draw_sprite_ext(s_heart, _filled, 32*i, -1, 1, 1, 0, color_, 1);
	}
}