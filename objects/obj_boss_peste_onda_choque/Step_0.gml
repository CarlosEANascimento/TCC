image_xscale = dir;

if( fim ){
	image_index = sprite_get_number(spr_boss_peste_onda_choque) - 1;
	image_alpha -= 0.025;
}

if( image_alpha <= 0 ) instance_destroy();
depth = obj_boss_peste.depth - 1;