if( place_meeting(x, y, obj_player) and !global.interagindo ){
	draw_set_font(fnt_compass_pro_24);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_text(x, bbox_top - 64 - sin(num * 0.15) * 2, "F");
}

draw_set_font(-1);
draw_self();

num++;