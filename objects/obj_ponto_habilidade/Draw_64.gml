if(draw_points_screen){

#region VARIAVEIS
var _centro_x = display_get_gui_width()/2;
var _centro_y = display_get_gui_height()/2;

var _ponto_a_x = _centro_x;
var _ponto_a_y = _centro_y - 128;

var _ponto_b_x = _centro_x + 128 * cos(120);
var _ponto_b_y = _centro_y + 128 * sin(120);

var _ponto_c_x = _centro_x - 128 * cos(120);
var _ponto_c_y = _centro_y + 128 * sin(120);

var _pontos_forca = global.nvl_forca;
var _pontos_defesa = global.nvl_defesa;
var _pontos_vida = global.nvl_vida;

//A
var _pontos_forca_x = _centro_x;
var _pontos_forca_y = (_pontos_forca < 1)? _centro_y - ((128/61) * 1) : _centro_y - ((128/61) * _pontos_forca + 1) ;

var _pontos_txt_forca_x = _centro_x;
var _pontos_txt_forca_y = _centro_y - 146;

//B
var _pontos_defesa_x = (_pontos_defesa < 1)? _centro_x + ((128/61) * 1) * cos(120) : _centro_x + ((128/61) * _pontos_defesa + 1) * cos(120) ;
var _pontos_defesa_y = (_pontos_defesa < 1)? _centro_y + ((128/61) * 1) * sin(120) : _centro_y + ((128/61) * _pontos_defesa + 1) * sin(120) ;

var _pontos_txt_defesa_x = _centro_x + 146 * cos(120);
var _pontos_txt_defesa_y = _centro_y + 146 * sin(120);

//C
var _pontos_vida_x = (_pontos_vida < 1)? _centro_x - ((128/61) * 1) * cos(120) : _centro_x - ((128/61) * _pontos_vida + 1) * cos(120) ;
var _pontos_vida_y = (_pontos_vida < 1)? _centro_y + ((128/61) * 1) * sin(120) : _centro_y + ((128/61) * _pontos_vida + 1) * sin(120) ;

var _pontos_txt_vida_x = _centro_x - 146 * cos(120);
var _pontos_txt_vida_y = _centro_y + 146 * sin(120);
#endregion

#region CORES
var _forca = make_color_rgb(170, 0, 0);
var _defesa = make_color_rgb(70, 70, 100);
var _vida = make_color_rgb(170, 30, 125);

var _centro = make_color_rgb(255, 255, 0);
#endregion

#region FUNDO
draw_set_alpha(0.7);
draw_circle_color(_centro_x, _centro_y, 164, c_black, c_black, 0);
#endregion

#region LINHAS
draw_set_alpha(1);
draw_line(_centro_x, _centro_y, _ponto_a_x, _ponto_a_y);
draw_line(_centro_x, _centro_y, _ponto_b_x, _ponto_b_y);
draw_line(_centro_x, _centro_y, _ponto_c_x, _ponto_c_y);
#endregion

#region ATRIBUTOS
draw_triangle_color(_centro_x, _centro_y, _pontos_forca_x, _pontos_forca_y, _pontos_defesa_x, _pontos_defesa_y, c_white, _forca, _defesa, 1);
draw_triangle_color(_centro_x, _centro_y, _pontos_defesa_x, _pontos_defesa_y, _pontos_vida_x, _pontos_vida_y, c_white, _defesa, _vida, 1);
draw_triangle_color(_centro_x, _centro_y, _pontos_vida_x, _pontos_vida_y, _pontos_forca_x, _pontos_forca_y, c_white, _vida, _forca, 1);

draw_set_font(fnt_monogram_extended_32);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);

draw_text_color(_pontos_txt_forca_x, _pontos_txt_forca_y, _pontos_forca, _forca, _forca, _forca, _forca, (atributo == 0)? 1 : 0.3 );
draw_text_color(_pontos_txt_defesa_x, _pontos_txt_defesa_y, _pontos_defesa, _defesa, _defesa, _defesa, _defesa, (atributo == 1)? 1 : 0.3);
draw_text_color(_pontos_txt_vida_x, _pontos_txt_vida_y, _pontos_vida, _vida, _vida, _vida, _vida, (atributo == 2)? 1 : 0.3);
#endregion

#region SELEÇÃO
draw_set_valign(fa_middle);
draw_set_halign(fa_center);

switch atributo{
	case 0: //FORÇA
	draw_text(_centro_x, _centro_y - 170, "Força");
	
	if( keyboard_check_released(vk_enter) ){
		global.nvl_forca++;
		global.interagindo = false;
		particulas(x, y, "ponto_habilidade_desaparece");
		instance_destroy();
	}
	break;
	
	case 1: //DEFESA
	draw_text(_centro_x, _centro_y - 170, "Defesa");
	
	if( keyboard_check_released(vk_enter) ){
		global.nvl_defesa++;
		global.interagindo = false;
		particulas(x, y, "ponto_habilidade_desaparece");
		instance_destroy();
	}
	break;
	
	case 2: //VIDA
	draw_text(_centro_x, _centro_y - 170, "Vida");
	
	if( keyboard_check_released(vk_enter) ){
		global.nvl_vida++;
		obj_player.vida_max += 10;
		global.interagindo = false;
		particulas(x, y, "ponto_habilidade_desaparece");
		instance_destroy();
	}
	break;
}

if( keyboard_check_pressed(vk_right) ){
	atributo++;
	if( atributo > 2 ) atributo = 0;
}else if( keyboard_check_pressed(vk_left) ){
	atributo--;
	if( atributo < 0 ) atributo = 2;
}
#endregion
}