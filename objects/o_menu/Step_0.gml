var color_hue_ = color_get_hue(color)+1;
if color_hue_ > 255
{
	color_hue_ = 0;	
}

color = make_color_hsv(color_hue_, saturation, value);
image_blend = color;