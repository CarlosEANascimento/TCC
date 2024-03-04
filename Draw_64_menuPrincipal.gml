#region variaveis
var _centro_x = display_get_gui_width()/2;
var _centro_y = display_get_gui_height()/2;

var _gui_larg = display_get_gui_width();
var _gui_altu = display_get_gui_height();

var _espaco = 16;

var _pos_x, _pos_y;
var _acao;
#endregion

#region cores
var _c_baixo = make_color_rgb(175, 150, 120);
var _c_alto = make_color_rgb(250, 230, 210);
#endregion

#region logo
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_yulong200);

draw_text_color( _espaco, lerp(0, _gui_altu, 0.0), "Noname", _c_alto, _c_alto, _c_baixo, _c_baixo, 1 );

draw_sprite_ext(spr_dragon_icon, 0, _espaco + string_width("N") + 3, lerp(0, _gui_altu, 0.1025), 1.311, 1.3, 0, -1, 1);
#endregion

#region botões
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(fnt_yulong64);

#region botão novo jogo
draw_text_color( _espaco * 2, lerp(_centro_y, _gui_altu, 0.0), "novo jogo", _c_alto, _c_alto, _c_baixo, _c_baixo, (_id == 1)? 1 : 0.4 );
#endregion

#region selecionar jogo salvo
draw_text_color( _espaco * 2, lerp(_centro_y, _gui_altu, 0.25), "escolher jogo salvo", _c_alto, _c_alto, _c_baixo, _c_baixo, (_id == 2)? 1 : 0.4 );
#endregion

#region selecionar controles
draw_text_color( _espaco * 2, lerp(_centro_y, _gui_altu, 0.5), "controles", _c_alto, _c_alto, _c_baixo, _c_baixo, (_id == 3)? 1 : 0.4 );
#endregion

#region selecionar sair
draw_text_color( _espaco * 2, lerp(_centro_y, _gui_altu, 0.75), "créditos", _c_alto, _c_alto, _c_baixo, _c_baixo, (_id == 4)? 1 : 0.4 );
#endregion

#region selecionar sair
draw_text_color( _espaco * 2, lerp(_centro_y, _gui_altu, 1), "sair", _c_alto, _c_alto, _c_baixo, _c_baixo, (_id == 5)? 1 : 0.4 );
#endregion

#region indicador
pos_y_real = lerp(_centro_y, _gui_altu, (_id - 1) * 0.25);


if( pos_y_temp != pos_y_real ){
	if( pos_y_temp > pos_y_real ){
		pos_y_temp -= point_distance(_espaco, pos_y_real, _espaco, pos_y_temp)/4;
	}else{
		pos_y_temp += point_distance(_espaco, pos_y_real, _espaco, pos_y_temp)/4;
	}
}

draw_triangle(_espaco - 4, pos_y_temp, _espaco + 4, pos_y_temp, _espaco, pos_y_temp - 4, 0);
draw_triangle(_espaco - 4, pos_y_temp, _espaco + 4, pos_y_temp, _espaco, pos_y_temp + 4, 0);
#endregion

#region mudar seleção
if( !instance_exists(obj_menu_principal_acao) ){

if( keyboard_check_pressed(vk_down) ){
	_id++;
	if( _id > 5 ) _id = 1;
}else if( keyboard_check_pressed(vk_up) ){
	_id--;
	if( _id < 1 ) _id = 5;
}

}
#endregion

#endregion

#region acoes

if( keyboard_check_released(vk_enter) and !instance_exists(obj_menu_principal_acao) ){
	_acao = instance_create_depth(0, 0, depth - 1, obj_menu_principal_acao);
	_acao._id = _id;
}

#endregion

window_set_fullscreen(1);