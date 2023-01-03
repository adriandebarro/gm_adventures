// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_button_title(p_x, p_y, p_w, p_h, p_title)
{
	var _inst = instance_create_depth(p_x, p_y, 0, oUITitle);
	
	with(_inst)
	{
		width = p_w;
		height = p_h;
		title = p_title;
	}
	
	return _inst;
}

function create_button_place_holder(p_x, p_y)
{
	var _inst = instance_create_depth(p_x, p_y, 0, oUIParent);
	return _inst;
}

function create_background_pause(p_use_shader)
{
	var _pauseSurf = surface_create(RES.WIDTH, RES.HEIGHT);
	surface_copy(_pauseSurf, 0, 0, application_surface);
	return _pauseSurf;
}
