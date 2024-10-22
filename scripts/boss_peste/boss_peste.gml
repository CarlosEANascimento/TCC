function boss_peste_grito(_sprite){
	if( !instance_exists(obj_boss_peste_grito) ){
		instance_create_depth(x, lerp(bbox_bottom, bbox_top, 0.5), depth + 1, obj_boss_peste_grito);
	}
	
	if( image_index >= sprite_get_number(_sprite) - 1 ){
		instance_destroy(obj_boss_peste_grito);
	}
	
	hspd = 0;
}