repeat(irandom_range(7, 14))
{
	instance_create_layer((irandom_range(0, 478) div 32) * 32 , (irandom_range(48, 240) div 32) * 32
	, "Instances", o_attack);
}

alarm[0] = 30;