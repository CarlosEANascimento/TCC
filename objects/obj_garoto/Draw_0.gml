draw_self();

#region dica
if( !interagindo and !seguindo and distance_to_object(obj_player) < 128 ){
	draw_set_font(fnt_compass_pro_24);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_text(x, bbox_top - 16 - sin(num * 0.15) * 2, "F");
}
#endregion