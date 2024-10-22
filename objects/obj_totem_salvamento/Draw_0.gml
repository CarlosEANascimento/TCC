if( place_meeting(x, y, obj_player) and !global.interagindo and !salvo ){
	draw_set_font(fnt_compass_pro_24);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_text(x, bbox_top - 64 - sin(num * 0.15) * 2, "F");
}else if( place_meeting(x, y, obj_player) and salvo ){
	draw_set_alpha(sin(num * 0.25));
	draw_set_font(fnt_compass_pro_24);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_text(x, bbox_top - 64 - sin(num * 0.15) * 2, "Jogo Salvo");
	reset_draw_settings();
	
	if(sin(num * 0.25) >= 1) primeiro = true;
	
	if(sin(num * 0.25) <= 0 and primeiro){
		salvo = false;
		primeiro = false;
	}
}



draw_set_font(-1);
draw_self();

num++;