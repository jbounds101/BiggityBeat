GET_INPUT = 0;

right_key = ord("D");
left_key = ord("A");
up_key = ord("W");
down_key = ord("S");

keyboard_set_map(vk_right, right_key);
keyboard_set_map(vk_left, left_key);
keyboard_set_map(vk_up, up_key);
keyboard_set_map(vk_down, down_key);

event_user(GET_INPUT);




