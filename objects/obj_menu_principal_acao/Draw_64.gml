if( !instance_exists(obj_transicao) ){

#region variaveis
var _gui_altu = display_get_gui_height();
var _gui_larg = display_get_gui_width();

var _centro_x = _gui_larg/2;
var _centro_y = _gui_altu/2;

var _nome_save = keyboard_string;

var _show_save;
var _save_larg;
#endregion

#region fundo
draw_set_color(c_black);
draw_set_alpha(0.6);
	
draw_rectangle(0, 0, _gui_larg, _gui_altu, 0);
	
reset_draw_settings();
#endregion

switch _id{
	#region novo jogo
	case 1: //novo jogo
	#region linha de texto
	draw_line_color(_centro_x, _centro_y, _centro_x - 256, _centro_y, c_white, c_black);
	draw_line_color(_centro_x, _centro_y, _centro_x + 256, _centro_y, c_white, c_black);
	#endregion
	
	#region texto
	if( string_length(_nome_save) > 15 ){
		keyboard_string = string_delete(_nome_save, string_length(_nome_save), 1);
	}
	_nome_save = keyboard_string;
	
	for( var _i = 0; _i <= load_qtd_saves(); _i++ ){
		if( string_upper(load_save_name(_i)) == string_upper(_nome_save) ){
			salvar = false;
			break;
		}else{
			salvar = true;
			continue;
		}
	}
	
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_set_font(fnt_beholden36);
	if( salvar ){
		draw_set_color(c_white);
	}else{
		draw_set_color(c_red);
		draw_text_transformed(_centro_x, _centro_y - string_height("AA"), "já há um jogo com esse nome", 0.4, 0.4, 0);
	}
	draw_text(_centro_x, _centro_y, string_upper(_nome_save));
	
	draw_set_alpha((!keyboard_check(vk_anykey))? sin(num * 0.1) : 1 );
	draw_line_width(_centro_x + string_width(string_upper(_nome_save))/2, _centro_y - 4, _centro_x + string_width(string_upper(_nome_save))/2, _centro_y - 4 - string_height("A"), 2);
	reset_draw_settings();
	#endregion
	
	#region dica
	draw_set_valign(fa_top);
	draw_set_halign(fa_center);
	draw_set_font(fnt_beholden18);
	draw_text(_centro_x, _centro_y, "máx. 15 caracteres");
	#endregion
	
	#region dicas
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_set_font(fnt_beholden64);
	
	draw_text_transformed(_centro_x, 0, " - esc para cancelar . enter para confirmar - ", 0.3, 0.3, 0);
	reset_draw_settings();
	#endregion
	
	#region salvar
	if( keyboard_check_released(vk_enter) and salvar and _nome_save != "" ){
		save_save_name(string_upper(_nome_save));
		
		instance_create_depth(-100, -100, depth, obj_player);
		global.save_name = _nome_save;
		
		room_goto(rm_cutscene_1);
	}
	#endregion
	break;
	#endregion
	
	#region jogos salvos
	case 2: //jogos salvos
	_show_save = load_save_name(save_id);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_set_font(fnt_beholden36);
	draw_text(_centro_x, _centro_y, string_upper(_show_save));
	_save_larg = string_width(string_upper(_show_save));
	
	draw_set_halign(fa_left);
	draw_set_font(fnt_beholden18);
	draw_text(_centro_x + 8 + sin(num * 0.25) + _save_larg/2, _centro_y, ">");
	draw_set_halign(fa_right);
	draw_text(_centro_x - 8 - sin(num * 0.25) - _save_larg/2, _centro_y, "<");
	
	#region dicas
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_set_font(fnt_beholden64);
	
	draw_text_transformed(_centro_x, 0, " - setas para esquerda e direita para mudar . enter para confirmar . esc para cancelar - ", 0.3, 0.3, 0);
	reset_draw_settings();
	#endregion
	
	#region mudar save
	if( keyboard_check_pressed(vk_left) ) save_id--;
	if( keyboard_check_pressed(vk_right) ) save_id++;
	if( save_id >= load_qtd_saves() ) save_id = 0;
	if( save_id < 0 ) save_id = load_qtd_saves() - 1;
	
	if( keyboard_check_pressed(vk_enter) and load_qtd_saves() > 0 ){
		instance_create_depth(-100, 0, depth, obj_player);
		//load_game(_show_save);
		
		if( !layer_exists("UPPER") ){
			layer_create(layer_get_depth("Instances"), "UPPER");
		}
		
		var _tran = instance_create_depth(0 ,0 ,depth, obj_transicao);
		_tran.destiny = load_save_infs(_show_save)._room;
		_tran.destiny_x = load_save_infs(_show_save)._x;
		_tran.destiny_y = load_save_infs(_show_save)._y;
		
		obj_player.vida   = load_save_infs(_show_save)._vida;
		obj_player.nivel  = load_save_infs(_show_save)._nivel;
		obj_player.experiencia  = load_save_infs(_show_save)._experiencia;
		global.nvl_forca  = load_save_infs(_show_save)._forca;
		global.nvl_defesa = load_save_infs(_show_save)._defesa;
		global.nvl_vida   = load_save_infs(_show_save)._vitalidade;
		global.garoto     = (load_save_infs(_show_save)._garoto == 1)? true : false ;
		global.save_name  = _show_save;
	
	}
	#endregion
	break;
	#endregion
	
	#region controles
	case 3: //controles
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_set_font(fnt_beholden64);
	
	draw_text_transformed(_centro_x, 0, ". esc para voltar .", 0.3, 0.3, 0);
	reset_draw_settings();
	
	draw_sprite_ext(spr_controles, 0, _centro_x, _centro_y, 1.5, 1.5, 0, c_white, 1);
	break;
	#endregion
	
	#region créditos
	case 4: //créditos
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_set_font(fnt_beholden64);
	
	draw_text_transformed(_centro_x, 0, ". esc para voltar .", 0.3, 0.3, 0);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fnt_beholden64);
	
	draw_text(_centro_x, _centro_y, "Ariel\nCaio\nCaio (Monte Alegre)\nCarlos\nEdson\nJuliany\nMiguel (Monte Alegre)")
	break;
	#endregion
	
	#region sair
	case 5: //sair
	game_end();
	break;
	#endregion
}

#region outros
if( keyboard_check_released(vk_escape) ){
	instance_destroy();
}

num++;
reset_draw_settings();
#endregion

}