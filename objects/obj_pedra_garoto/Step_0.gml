if( !param ){
	vspd = irandom_range(-10, -20)
	hspd = (distance_to_object(alvo)/abs(vspd)) * dir;
	
	param = true;
}else{
	move_and_collide(hspd, vspd, obj_bloco);

	if( !place_meeting(x, y + 1, obj_bloco) ){
		//hspd += 2 * dir;
		vspd += 2;
	}else{
		hspd = 0;
		vspd = 0;
		instance_destroy();
	}
}