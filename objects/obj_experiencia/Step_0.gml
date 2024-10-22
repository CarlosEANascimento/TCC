move_and_collide(hspd, vspd, obj_bloco);

if( place_meeting(x, (y + vspd) + 5, obj_bloco) ){
	hspd = (obj_player.x > x)? 2 : -2 ;
	vspd = 0;
}else{
	vspd += 0.5;
}

depth = obj_player.depth - 1;

y += sin(sin_num * 0.25) * 0.5;
sin_num++;

image_blend = make_color_rgb(255, 0, (sin(sin_num * 0.25) * 127.5) + 127.5);

if( irandom(3) < 1 ) particulas(x, y, "exp_mov");

ilu.x = x;
ilu.y = y;
ilu.image_blend = image_blend;