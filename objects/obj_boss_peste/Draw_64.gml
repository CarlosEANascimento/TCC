var _espacos = 16;
var _larg_health_bar = display_get_gui_width() - (_espacos * 2);
var _gui_height = display_get_gui_height();

var _qt_vida;

switch fase{
	case 1:
	_qt_vida = (100/vida_fase1) * vida;
	break;
	case 2:
	_qt_vida = (100/vida_fase2) * vida;
	break;
	case 3:
	_qt_vida = (100/vida_fase3) * vida;
	break;
}

if( fase < 4 ){
	var _bk_color = make_color_rgb(60, 70, 50);
	var _min_vida = make_color_rgb(150, 0, 0);
	var _max_vida = make_color_rgb(200, 0, 0);

	var _green = make_color_rgb(0, 140, 0);

	draw_set_font(fnt_dungeon_font_24);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_left);
	draw_text_color(_espacos + 2, _gui_height - (_espacos * 1.5) + 2, "Peste", _green, _green, _green, _green, 1);
	draw_text(_espacos, _gui_height - (_espacos * 1.5), "Peste");

	draw_healthbar(_espacos, _gui_height - (_espacos * 1.5), _espacos + _larg_health_bar, _gui_height - _espacos, _vida, _bk_color, _min_vida, _max_vida, 0, 1, 1);

	_vida = lerp(_vida, _qt_vida, 0.5);
}