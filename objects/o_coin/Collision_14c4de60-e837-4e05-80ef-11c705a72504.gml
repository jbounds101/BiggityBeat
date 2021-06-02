global.score_points += 100 * global.score_multiplier;

if y != 32
{
	var text_holder_ = instance_create_layer(x+16, y-8, "Instances", o_coin_text);
}
else
{
	var text_holder_ = instance_create_layer(x+16, y+40, "Instances", o_coin_text);
}
text_holder_.text_score = "+"+string(100*global.score_multiplier);
if global.score_multiplier != 16
{
	global.score_multiplier *= 2;
}

o_coin_spawner.coin_exists = false;

instance_destroy();