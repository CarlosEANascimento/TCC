with(all){ display_set_gui_size(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0])); }

if( !global.interagindo ){
	#region DETERMINANDO VALORES E VARIAVEIs
	var _gui_larg = display_get_gui_width();
	var _gui_altu = display_get_gui_height();

	var _larg_hud = 192;
	var _espaco_x = 4;
	var _espaco_y = 4;

	var _pos_x = 0;
	var _pos_y = 0;

	var _larg = ((_larg_hud - (_espaco_x * 3))/3) * 0.75;
	var _altu = _larg * 0.75;

	var _colldown1 = alarm[8];
	var _colldown2 = alarm[9];
	var _colldown3 = alarm[10];

	_colldown1 = clamp(_colldown1, 0, alarm[8]  + 1);
	_colldown2 = clamp(_colldown2, 0, alarm[9]  + 1);
	_colldown3 = clamp(_colldown3, 0, alarm[10] + 1);

	var _colldown_time1 = global.colldown_hab1;
	var _colldown_time2 = global.colldown_hab2;
	var _colldown_time3 = global.colldown_hab3;

	var _max_pocoes = pcs_cura_max;
	var _qt_pocoes = pcs_cura;
	var _spr_pocao = spr_cura;

	var _escala_pocao = (_larg_hud - (_espaco_x * (_max_pocoes - 3)))/_max_pocoes;

	var _nvl_forca = global.nvl_forca;
	var _nvl_defesa = global.nvl_defesa;
	var _nvl_vida = global.nvl_vida;

	var _larg_atributos = 0;
	var _altu_atributos = 0;

	var _qt_exp = 100 * (((exp_temp * 100)/(nivel * 5)))/100;
	#endregion

	#region CORES
	var _cinza_fundo = make_color_rgb(30, 30, 30);
	var _vida_min = make_color_rgb(180, 0, 0);
	var _vida_max = make_color_rgb(230, 0, 0);
	var _vida_temp = make_color_rgb(255, 200, 200);

	var _exp_color = make_color_rgb(255, 255, 0);

	var _forca = make_color_rgb(170, 0, 0);
	var _defesa = make_color_rgb(70, 70, 100);
	var _vida = make_color_rgb(170, 30, 125);
	#endregion

	#region BARRA DE VIDA/BARRA DE EXPERIENCIA
	if( !global.interagindo ){
		//BARRA VIDA
		draw_healthbar(
		4, 4, 4 + _larg_hud + (vida_max - 100)/5, 8, vida_temp, _cinza_fundo, _vida_min, (vida != vida_temp)? _vida_temp : _vida_max, 0, 1, 1
		);
	
		draw_healthbar(
		4, 10, 4 + _larg_hud, 11, _qt_exp, _cinza_fundo, _exp_color, _exp_color, 0, 1, 1
		);
	
		vida_temp = lerp(vida, vida_temp, 0.25);
		exp_temp = lerp(experiencia, exp_temp, 0.25);
	}
	
	if( vida != vida_temp and vida < 100 ){
		if( vida < vida_temp ){
			r_luz_ambiente = 225;
			g_luz_ambiente = 125;
			b_luz_ambiente = 125;
		}else{
			r_luz_ambiente = 125;
			g_luz_ambiente = 225;
			b_luz_ambiente = 125;
		}
	}
	
	r_luz_ambiente = (r_luz_ambiente > rgb_padrao)? r_luz_ambiente - 4 : r_luz_ambiente + 4 ;
	r_luz_ambiente = clamp(r_luz_ambiente, 125, 225);				 					 
	g_luz_ambiente = (g_luz_ambiente > rgb_padrao)? g_luz_ambiente - 4 : g_luz_ambiente + 4 ;
	g_luz_ambiente = clamp(g_luz_ambiente, 125, 225);									  
	b_luz_ambiente = (b_luz_ambiente > rgb_padrao)? b_luz_ambiente - 4 : b_luz_ambiente + 4 ;
	b_luz_ambiente = clamp(g_luz_ambiente, 125, 225);
	
	if( instance_exists(obj_render_luz) ) obj_render_luz.luz_ambiente = make_color_rgb(r_luz_ambiente, g_luz_ambiente, b_luz_ambiente);
	
	_pos_x = 4;
	_pos_y = 13;
	#endregion

	#region POÇÔES
	_pos_x = _espaco_x;

	repeat( pcs_cura ){
		draw_sprite_ext(
		_spr_pocao, 0, _pos_x + (sprite_get_width(_spr_pocao) * (_escala_pocao/sprite_get_height(_spr_pocao)))/2, _pos_y + _escala_pocao, _escala_pocao/sprite_get_height(_spr_pocao), _escala_pocao/sprite_get_height(_spr_pocao), 0, c_white, 1
		);
	
		_pos_x += _espaco_x + _escala_pocao;
	}
	#endregion

	#region ATRIBUTOS
	draw_set_font(fnt_monogram_extended_16);

	_larg_atributos = string_width("00") + 2;
	_altu_atributos = string_height(_nvl_forca) + string_height(_nvl_defesa) + string_height(_nvl_vida);

	draw_set_alpha(0.75);
	draw_rectangle_color(0, (_gui_altu/2) - (_altu_atributos/2), _larg_atributos, (_gui_altu/2) + (_altu_atributos/2), c_black, c_black, c_black, c_black, 0);
	draw_set_alpha(1);

	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_text_color(_larg_atributos/2, (_gui_altu/2) - (string_height(_nvl_defesa)/2) - string_height(_nvl_forca), _nvl_forca, _forca, _forca, _forca, _forca, 1);
	draw_text_color(_larg_atributos/2, (_gui_altu/2) - (string_height(_nvl_defesa)/2), _nvl_defesa, _defesa, _defesa, _defesa, _defesa, 1);
	draw_text_color(_larg_atributos/2, (_gui_altu/2) + (string_height(_nvl_defesa)/2), _nvl_vida, _vida, _vida, _vida, _vida, 1);
	#endregion

	#region HABILIDADES
	_pos_x = _gui_larg	- (_larg * 3) - (_espaco_x * 6);
	_pos_y = _espaco_y;

	#region HABILIDADE 1
	draw_rectangle_color(_pos_x, _pos_y, _pos_x + _larg, _pos_y + _altu, c_purple, c_purple, c_purple, c_purple, 0);
	draw_sprite_ext(spr_icon_hab_1, 0, _pos_x, _pos_y, (_larg + 1)/sprite_get_width(spr_icon_hab_1), (_altu + 1)/sprite_get_height(spr_icon_hab_1), 0, c_white, 1);

	draw_set_alpha(0.6);
	draw_rectangle_color(_pos_x, _pos_y + _altu, _pos_x + _larg, (_pos_y + _altu) - (_altu/_colldown_time1) * _colldown1, c_black, c_black, c_black, c_black, 0);
	draw_set_alpha(1);

	if( _colldown1 != 0 ){
		draw_set_font(fnt_monogram_extended_16);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text(_pos_x + _larg/2, _pos_y + _altu/2, round(_colldown1/60));
	}

	draw_set_font(fnt_compass_pro_12);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(_pos_x, _pos_y + _altu, "Q");

	_pos_x += _larg + _espaco_x * 2;
	#endregion

	#region HABILIDADE 2
	draw_rectangle_color(_pos_x, _pos_y, _pos_x + _larg, _pos_y + _altu, c_purple, c_purple, c_purple, c_purple, 0);
	draw_sprite_ext(spr_icon_hab_2, 0, _pos_x, _pos_y, (_larg + 1)/sprite_get_width(spr_icon_hab_2), (_altu + 1)/sprite_get_height(spr_icon_hab_2), 0, c_white, 1);

	draw_set_alpha(0.6);
	draw_rectangle_color(_pos_x, _pos_y + _altu, _pos_x + _larg, (_pos_y + _altu) - (_altu/_colldown_time2) * _colldown2, c_black, c_black, c_black, c_black, 0);
	draw_set_alpha(1);

	//draw_rectangle_color(_pos_x, _pos_y, _pos_x + _larg, _pos_y + _altu, c_gray, c_gray, c_gray, c_gray, 1);

	if( _colldown2 != 0 ){
		draw_set_font(fnt_monogram_extended_16);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text(_pos_x + _larg/2, _pos_y + _altu/2, round(_colldown2/60));
	}

	draw_set_font(fnt_compass_pro_12);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(_pos_x, _pos_y + _altu, "E");

	_pos_x += _larg + _espaco_x * 2;
	#endregion

	#region HABILIDADE 3
	draw_rectangle_color(_pos_x, _pos_y, _pos_x + _larg, _pos_y + _altu, c_purple, c_purple, c_purple, c_purple, 0);
	draw_sprite_ext(spr_icon_hab_3, 0, _pos_x, _pos_y, (_larg + 1)/sprite_get_width(spr_icon_hab_3), (_altu + 1)/sprite_get_height(spr_icon_hab_3), 0, c_white, 1);

	draw_set_alpha(0.6);
	draw_rectangle_color(_pos_x, _pos_y + _altu, _pos_x + _larg, (_pos_y + _altu) - (_altu/_colldown_time3) * _colldown3, c_black, c_black, c_black, c_black, 0);
	draw_set_alpha(1);

	if( _colldown3 != 0 ){
		draw_set_font(fnt_monogram_extended_16);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text(_pos_x + _larg/2, _pos_y + _altu/2, round(_colldown3/60));
	}

	draw_set_font(fnt_compass_pro_12);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(_pos_x, _pos_y + _altu, "R");
	#endregion

	#endregion

	#region TESTES
	draw_set_font(fnt_monogram_extended_16);

	if( keyboard_check(vk_alt) ){
		
		//draw_text(50, 10, sprite_get_bbox_bottom(sprite_index) - sprite_get_bbox_top(sprite_index));
		//draw_text(50, 30, sprite_get_bbox_right(sprite_index) - sprite_get_bbox_left(sprite_index));
		
	//	draw_text(10, 30, image_index);
	//	draw_text(10, 50, sprite_get_number(sprite_index));
	//	draw_text(10, 70, image_number);
	//	draw_text(10, 90, image_number - 1);
	//	draw_text(10, 110, sprite_get_name(sprite_index));
	//	draw_text(10, 130, sprite_get_number(sprite_index) - image_index);

	//	if( instance_exists(obj_player_habilidade_3) ) draw_text(10, 150, obj_player_habilidade_3.etapa);
	//	if( instance_exists(obj_player_habilidade_3) ) draw_text(10, 170, obj_player_habilidade_3.image_angle);
	}
	#endregion
}