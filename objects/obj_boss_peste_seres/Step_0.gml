if( place_meeting(x, y + 1, obj_bloco) ){
	hspd = (obj_player.x < x)? vel * -1 : vel ;
	image_xscale = sign(hspd);
	if(distance_to_object(obj_player) < 32) vspd = irandom_range(-8, -10);
	hit = true;
}

gravidade();

move_and_collide((distance_to_object(obj_player) < 32)? 15 * sign(hspd) : hspd , vspd, obj_bloco);

if( vida <= 0 ){
	instance_destroy();
}