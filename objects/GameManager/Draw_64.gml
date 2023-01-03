if(_paused)
{
	var _space_w = 100;
	var _x = display_get_gui_width() / 2;
	var _y = display_get_gui_height() / 2 - 300;
	
	// and draw the pause menu
	var _title = create_button_title(_x, _y, 50, 20, "Paused");
	_y += (_space_w);
	create_button_place_holder(_x, _y);
	_y += (20 + 30);
	create_button_place_holder(_x, _y);
}
