var _proximo;

try{
	_proximo = proximo;
	c_box = collision_rectangle(bbox_left - 1, bbox_top - 1, bbox_right + 1, bbox_bottom + 1, obj_bloco, 0, 1);
	
	if( c_box ){
		hspd = _proximo.hspd;
		vspd = _proximo.vspd;
		image_angle = _proximo.image_angle;
		image_xscale = _proximo.image_xscale;
		image_yscale = _proximo.image_yscale;
	}
	
	move_and_collide(hspd, vspd, obj_null);
}catch(_proximo){
	instance_destroy();
}