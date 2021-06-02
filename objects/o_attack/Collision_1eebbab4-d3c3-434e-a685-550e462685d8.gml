if damaged_player == false
{
	if image_index == 1 and o_player.alarm[2] <= 0
	{
		if not o_player.debug
		{
			o_player.alarm[2] = 60;
			o_player.hitpoints -= 1;
			global.score_multiplier = 1;
			audio_play_sound(choose(so_miss1, so_miss2, so_miss3, so_miss4), 40, false);
			damaged_player = true;
		}
	}
	instance_destroy();
}