if(_paused)
{
	var _space_w = 10;
	var _x = RES.WIDTH / 2 - 30;
	var _y = 10;
	
	// and draw the pause menu
	var _title = create_button_title(_x, _y, 30, 15, "Paused");
	_y += (_space_w + 50);
	create_button_place_holder(_x, _y);
	_y += (20);
	create_button_place_holder(_x, _y);
}
else
{
	// TODO draw the GUI on the screen 
	// Add the timer and the amount of hearts the player has
}
