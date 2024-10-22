depth = obj_player.depth - 1;

if(	!place_meeting(x, (y + vspd) + 8, obj_bloco) ){
	vspd += 0.75;
}else{
	vspd = 0;
	hspd = 0;
	sin_num++;
}

y += sin(sin_num * 0.25);

move_and_collide(hspd, vspd, obj_bloco);

ilu.x = x;
ilu.y = y;