draw_set_font(fnt_yulong64);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(display_get_gui_width()/2, display_get_gui_height()/2, "Muito obrigado por ter jogado\nNoname");

draw_set_font(fnt_beholden36);
draw_set_valign(fa_top);
draw_text(display_get_gui_width()/2, 0, " - aperte ESC para retornar ao menu principal - ")

if( keyboard_check_pressed(vk_escape) ){
	game_restart();
}