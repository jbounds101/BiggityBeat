var color_value = color_get_value(o_player.color);
var color_ = make_color_hsv(color_get_hue(o_player.color), color_get_saturation(o_player.color), color_value - 100);

draw_set_font(f_font);
draw_set_halign(fa_right);
draw_set_valign(fa_top);

draw_text_color(460, 7, "SCORE  (" + string(global.score_multiplier) + "x)   " + string(global.score_points), color_, color_, color_, color_, 1);