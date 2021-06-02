if not coin_exists and o_player.skip_beat
{
	coin_exists = true;
	instance_create_layer((irandom_range(0, 478) div 32) * 32 , (irandom_range(48, 240) div 32) * 32
	, "Instances", o_coin);
}

alarm[0] = 30;