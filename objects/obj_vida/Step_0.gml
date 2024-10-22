move_and_collide(hspd, vspd, obj_bloco);

if( !place_meeting(x, (y + vspd) + 5, obj_bloco) ){
	vspd += 0.5;
}else{
	vspd = 0;
	hspd = 0;
}

depth = obj_player.depth - 1;

y += sin(sin_num * 0.25) * 0.5;
sin_num++;

if( irandom(3) < 1 ) particulas(x, y, "exp_mov");

ilu.x = x;
ilu.y = y;
ilu.image_blend = c_purple;