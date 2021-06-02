var arg, i = 0
repeat(argument_count)
{
	arg[i] = argument[i];
	i++;
}

var ds_grid_id = ds_grid_create(5, argument_count);
i = 0; 
repeat(argument_count)
{
	var array = arg[i];
	var	array_len = array_length_1d(array);
	
	var x_value = 0; 
	repeat(array_len)
	{
		ds_grid_id[# x_value, i] = array[x_value];
		x_value++;
	}
	
	i++;
}


return ds_grid_id;