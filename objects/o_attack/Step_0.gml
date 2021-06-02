image_alpha = 1/(alarm[0]/8);

if alarm[0] <= 0
{
	image_alpha = 1;	
}

if o_player.skip_beat
{
	image_blend = o_player.color;
	
	if not alarm[0] <= 0
	{
		alarm[0] += 1;	
		
	}
	if not alarm[1] <= 0
	{
		alarm[1] += 1;	
	}
}
else
{
	//image_blend = c_white;	
}
