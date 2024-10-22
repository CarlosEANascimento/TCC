if( !fim ){
	obj_player.vspd = irandom_range(-20, -15);
	obj_player.hspd = (x > obj_player.x)? irandom_range(-30, -25) : irandom_range(25, 30) ;
	if( alarm[0] <= 0 ){
		other.vida -= 5 - (5 * global.nvl_defesa/50);
		alarm[0] = 45;
	}
}