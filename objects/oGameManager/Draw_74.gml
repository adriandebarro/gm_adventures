if(pauseSurface && surface_exists(pauseSurface))
{
	shader_set(sShader1);
	var shader_u_time = shader_get_uniform(sShader1, "u_time");
	var shader_res = shader_get_uniform(sShader1, "u_resolution");
	var shader_texture = shader_get_uniform(sShader1, "u_background_texture");
	
	var _time = get_timer() / 1000000;
	shader_set_uniform_f(shader_u_time, _time);
	shader_set_uniform_f(shader_res, RES.WIDTH, RES.HEIGHT);
	shader_set_uniform_f(shader_texture, pauseSurface);
	
	draw_surface_ext(pauseSurface, 0,0,1,1,0,c_red, 1);	
	shader_reset();
}

