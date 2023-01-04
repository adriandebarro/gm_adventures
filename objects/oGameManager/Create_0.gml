/// @description Insert description here
//// You can write your code in this editor

//global.P_System = part_system_create_layer("Instances", false);

//global.Particle1 = part_type_create();

//part_type_shape(global.Particle1, pt_shape_pixel);
//part_type_size(global.Particle1, 1, 5, 0, 0.5);
//part_type_color3(global.Particle1, c_aqua, c_lime, c_red);
//part_type_alpha3(global.Particle1, 0.5, 1, 0);
//part_type_speed(global.Particle1, 2, 5, -0.10, 0);
//part_type_direction(global.Particle1, 0, 359, 0, 20);
//part_type_blend(global.Particle1, true);
//part_type_life(global.Particle1, 30, 500);


//global.Emitter1 = part_emitter_create(global.P_System);
//part_emitter_region(global.P_System, global.Emitter1,0, room_width, 0, room_height, pt_shape_cloud, ps_distr_gaussian);
//part_emitter_stream(global.P_System, global.Emitter1, global.Particle1, 500);
//alarm[0] = room_speed;

// resolution details
enum RES
{
	WIDTH = 320,
	HEIGHT = 180,
	SCALE = 4
}


_paused = false;
pauseSurface = noone;

camera = camera_create_view(0, 0, RES.WIDTH, RES.HEIGHT, 0, oCharacter, -1, -1, RES.WIDTH / 2, RES.HEIGHT/2);

view_enabled = true;
view_visible[0] = true;

view_set_camera(0, camera);