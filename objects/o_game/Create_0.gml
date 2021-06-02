started_music = false;

global.score_points = 0;
global.score_multiplier = 1;

global.one_second = 60;

global.view_width = camera_get_view_width(view_camera[0]);
global.view_height = camera_get_view_height(view_camera[0]);

up_key = ord("W");
left_key = ord("A");
down_key = ord("S");
right_key = ord("D");

display_set_gui_size(global.view_width, global.view_height);

enum menu_page
{
	main,
	settings,
	audio,
	graphics,
	controls,
	height
}

enum menu_element_type
{
	script_run,
	page_transfer,
	slider,
	shift,
	toggle,
	input
}

ds_menu_main = create_menu_page
(
	["START", menu_element_type.script_run, start_game],
	["SETTINGS", menu_element_type.page_transfer, menu_page.settings],
	["EXIT", menu_element_type.script_run, exit_game]
);

ds_menu_settings = create_menu_page
(
	["AUDIO", menu_element_type.page_transfer, menu_page.audio],
	["GRAPHICS", menu_element_type.page_transfer, menu_page.graphics],
	["CONTROLS", menu_element_type.page_transfer, menu_page.controls],
	["BACK", menu_element_type.page_transfer, menu_page.main]
);

ds_menu_audio = create_menu_page
(
	["MASTER", menu_element_type.slider, change_volume, 1, [0,1]],
	["SOUNDS", menu_element_type.slider, change_volume, 1, [0,1]],
	["MUSIC", menu_element_type.slider, change_volume, 1, [0,1]],
	["BACK", menu_element_type.page_transfer, menu_page.main]
);

ds_menu_graphics = create_menu_page
(
	["RESOLUTION", menu_element_type.shift, change_resolution, 1, ["640 x 360", "1280 x 720", "1600 x 900", "1920 x 1080", "2560 x 1440"]],
	["FULLSCREEN MODE", menu_element_type.toggle, change_window_mode, 1, ["FULLSCREEN", "WINDOWED"]],
	["BACK", menu_element_type.page_transfer, menu_page.main]
);

ds_menu_controls = create_menu_page
(
	["UP", menu_element_type.input, "up_key", ord("W")],
	["LEFT", menu_element_type.input, "left_key", ord("A")],
	["DOWN", menu_element_type.input, "down_key", ord("S")],
	["RIGHT", menu_element_type.input, "right_key", ord("D")],
	["BACK", menu_element_type.page_transfer, menu_page.main]
);

page = 0;
menu_pages = [ds_menu_main, ds_menu_settings, ds_menu_audio, ds_menu_graphics, ds_menu_controls];

var i = 0
var array_len =  array_length_1d(menu_pages);
repeat(array_len)
{
	menu_option[i] = 0
	i++;
}

inputting = false;