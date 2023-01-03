var _escKeyPressed = keyboard_check_pressed(vk_escape);


if(_escKeyPressed)
{
	_paused = !_paused;
	
	if(_paused)
	{
		pauseSurface = create_background_pause(false);
		// deactivate all elements 
		instance_deactivate_all(true);
	}
	else
	{	
		
		if(surface_exists(pauseSurface))
		
		// enable them
		event_user(0);
		instance_activate_all();
	}
}

//if(_mousePress)
//{
//	part_particles_create(global.P_System, mouse_x, mouse_y, global.Particle1, 1);
//}




