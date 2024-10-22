function particulas(_ox, _oy, _type, _in_x = 0, _fm_x = 0, _in_y = 0, _fm_y = 0){

	var _sistema = part_system_create();
	var _tipo = part_type_create();
	var _emissor = part_emitter_create(_sistema);
	
	switch _type{
		#region PLAYER
		case "PULO":

		part_type_sprite(_tipo,spr_part_dust,1,1,0);
		part_type_alpha2(_tipo,0,1);
		part_type_speed(_tipo,0.5,0.75,-0.01,0);
		part_type_direction(_tipo,90,90,0,0);
		part_type_life(_tipo,30,30);
		
		part_emitter_region(_sistema,_emissor,x,x,bbox_bottom,bbox_bottom,ps_shape_ellipse,ps_distr_gaussian);
		part_emitter_burst(_sistema,_emissor,_tipo,1);
		break;
		
		case "dash":
		part_type_sprite(_tipo, spr_dash, 1, 1, 0);
		part_type_scale(_tipo, sign(image_xscale) * ((abs(abs(x) - abs(xprevious)))/sprite_get_width(spr_dash)), 1);
		part_type_alpha2(_tipo, 0.8, 0);
		part_type_life(_tipo, 32, 32);

		part_emitter_region(_sistema, _emissor, x, x, lerp(bbox_top, bbox_bottom, 0.5), lerp(bbox_top, bbox_bottom, 0.5), ps_shape_diamond, ps_distr_linear);
		part_emitter_burst(_sistema, _emissor, _tipo, 1);
        break;
		
		case "cura":
		part_type_shape(_tipo, pt_shape_flare);
		part_type_alpha3(_tipo, 0, 1, 0);
		part_type_color1(_tipo, make_color_rgb(255, 250, 180));
		part_type_size(_tipo, 0.075, 0.1, -0.001, 0);
		part_type_direction(_tipo, 0, 360, 0, 0);
		part_type_speed(_tipo, 3, 3.5, 0, 0);
		part_type_life(_tipo, 16, 24);

		part_emitter_region(_sistema, _emissor, x, x, lerp(bbox_top, bbox_bottom, 0.5), lerp(bbox_top, bbox_bottom, 0.5), ps_shape_ellipse, ps_distr_invgaussian);
		part_emitter_burst(_sistema, _emissor, _tipo, 24);
		break;
		
		case "coletando":
		part_type_shape(_tipo, pt_shape_spark);
		part_type_size(_tipo, 0.05, 0.1, 0, 0);
		part_type_alpha3(_tipo, 0, 1, 0);
		part_type_direction(_tipo, 0, 360, 0, 0);
		part_type_speed(_tipo, 1, 2, 0, 0);
		part_type_life(_tipo, 16, 24);

		part_emitter_region(_sistema, _emissor, lerp(bbox_left, bbox_right, 0.5), lerp(bbox_left, bbox_right, 0.5), lerp(bbox_top, bbox_top, 0.5), lerp(bbox_top, bbox_top, 0.5), ps_shape_diamond, ps_distr_linear);
		part_emitter_burst(_sistema, _emissor, _tipo, 16);
		break;
		#endregion
		
		#region HABILIDADE3
		case "hab3 - etapa2":
		part_type_shape(_tipo, pt_shape_spark);
        part_type_size(_tipo, 0.05, 0.1, 0, 0);
        part_type_alpha3(_tipo, 0, 1, 0);
        part_type_life(_tipo, 32, 64);

        part_emitter_region(_sistema, _emissor, bbox_left, bbox_right, bbox_top, bbox_bottom, ps_shape_diamond, ps_distr_linear);
        part_emitter_burst(_sistema, _emissor, _tipo, 3);
		break;
		
		case "hab3 - etapa3":
        part_type_shape(_tipo, pt_shape_flare);
        part_type_size(_tipo, 0.1, 0.13, 0, 0);
        part_type_alpha3(_tipo, 0, 1, 0);
        part_type_direction(_tipo, 0, 360, 0, 0);
        part_type_speed(_tipo, 20, 24, -1, 0);
        part_type_life(_tipo, 12, 16);

        part_emitter_region(_sistema, _emissor, bbox_left, bbox_right, bbox_top, bbox_bottom, ps_shape_diamond, ps_distr_linear);
        part_emitter_burst(_sistema, _emissor, _tipo, 32);
        break;
		
		case "hab3.2":
        part_type_shape(_tipo, pt_shape_disk);
        part_type_size(_tipo, 0.02, 0.025, 0, 0);
        part_type_alpha2(_tipo, 1, 0);
        part_type_life(_tipo, 32, 64);

        part_emitter_region(_sistema, _emissor, bbox_left, bbox_right, bbox_top, bbox_bottom, ps_shape_diamond, ps_distr_linear);
        part_emitter_burst(_sistema, _emissor, _tipo, 8);
        break;
		#endregion
		
		#region EXPERIENCIA
        case "exp_mov":
        part_type_shape(_tipo, pt_shape_spark);
        part_type_size(_tipo, 0.05, 0.1, 0, 0);
        part_type_alpha3(_tipo, 0, 1, 0);
        part_type_life(_tipo, 32, 64);

        part_emitter_region(_sistema, _emissor, bbox_left, bbox_right, bbox_top - 4, bbox_bottom + 4, ps_shape_diamond, ps_distr_linear);
        part_emitter_burst(_sistema, _emissor, _tipo, 1);
        break;
        #endregion
		
		#region COMBATE
		case "big_hit":
		part_type_sprite(_tipo, spr_vfx_big_hit, 1, 0, 0);
		part_type_scale(_tipo, 
		clamp(((other.bbox_bottom - other.bbox_top)*0.75)/sprite_get_height(spr_vfx_big_hit), 1, ((other.bbox_bottom - other.bbox_top)*0.75)/sprite_get_height(spr_vfx_big_hit)),
		clamp(((other.bbox_bottom - other.bbox_top)*0.75)/sprite_get_height(spr_vfx_big_hit), 1, ((other.bbox_bottom - other.bbox_top)*0.75)/sprite_get_height(spr_vfx_big_hit)));
		part_type_alpha1(_tipo, 1);
		part_type_life(_tipo, 24, 32);
		
		part_emitter_region(_sistema, _emissor, _in_x, _fm_x, _in_y, _fm_y, ps_shape_ellipse, ps_distr_gaussian);
		part_emitter_burst(_sistema, _emissor, _tipo, 1);
		break;
		
		case "blood_impact":
		part_type_sprite(_tipo, spr_vfx_blood_impact, 1, 0, 0);
		part_type_scale(_tipo, 
		clamp(((other.bbox_bottom - other.bbox_top)*1)/sprite_get_height(spr_vfx_blood_impact), 1, ((other.bbox_bottom - other.bbox_top)*1)/sprite_get_height(spr_vfx_blood_impact)), 
		clamp(((other.bbox_bottom - other.bbox_top)*1)/sprite_get_height(spr_vfx_blood_impact), 1, ((other.bbox_bottom - other.bbox_top)*1)/sprite_get_height(spr_vfx_blood_impact)));
		part_type_alpha1(_tipo, 1);
		part_type_life(_tipo, 24, 32);
		
		part_emitter_region(_sistema, _emissor, _in_x, _fm_x, _in_y, _fm_y, ps_shape_ellipse, ps_distr_gaussian);
		part_emitter_burst(_sistema, _emissor, _tipo, 1);
		break;
		
		case "impact":
		part_type_sprite(_tipo, spr_vfx_impact, 1, 1, 0);
		part_type_scale(_tipo, 
		clamp(((other.bbox_bottom - other.bbox_top)*0.75)/sprite_get_height(spr_vfx_impact), 1, ((other.bbox_bottom - other.bbox_top)*0.75)/sprite_get_height(spr_vfx_impact)), 
		clamp(((other.bbox_bottom - other.bbox_top)*0.75)/sprite_get_height(spr_vfx_impact), 1, ((other.bbox_bottom - other.bbox_top)*0.75)/sprite_get_height(spr_vfx_impact)));
		part_type_alpha1(_tipo, 1);
		part_type_life(_tipo, 24, 32);
		
		part_emitter_region(_sistema, _emissor, _in_x, _fm_x, _in_y, _fm_y, ps_shape_ellipse, ps_distr_linear);
		part_emitter_burst(_sistema, _emissor, _tipo, 1);
		break;
		
		case "morte":
		part_type_shape(_tipo, pt_shape_flare);
		part_type_size(_tipo, 0.05, 0.1, 0, 0);
		part_type_color2(_tipo, c_white, make_color_rgb(255,250,180));
		part_type_alpha3(_tipo, 0, 1, 0);
		part_type_direction(_tipo, 110, 110, 0, 20);
		part_type_speed(_tipo, 1.5, 2, -0.005, 0);
		part_type_life(_tipo, 32, 48);
		
		part_emitter_region(_sistema, _emissor, bbox_left, bbox_right, bbox_top, bbox_bottom, ps_shape_rectangle, ps_distr_gaussian);
        part_emitter_burst(_sistema, _emissor, _tipo, (bbox_right - bbox_left) * 0.5);
		break;
		#endregion
		
		#region VENENO
		case "veneno_surge":
		part_type_sprite(_tipo, spr_vfx_veneno_surge, 1, 1, 0);
		part_type_scale(_tipo, 1, 1);
		part_type_life(_tipo, 32, 48);
		
		part_emitter_region(_sistema, _emissor, _ox, _ox, _oy, _oy, ps_shape_ellipse, ps_distr_gaussian);
		part_emitter_burst(_sistema, _emissor, _tipo, 1);
		break;
		
		case "veneno_explode":
		part_type_sprite(_tipo, spr_vfx_veneno_explode, 1, 1, 0);
		part_type_scale(_tipo, 1, 1);
		part_type_life(_tipo, 32, 48);
		
		part_emitter_region(_sistema, _emissor, _ox, _ox, _oy, _oy, ps_shape_ellipse, ps_distr_gaussian);
		part_emitter_burst(_sistema, _emissor, _tipo, 1);
		break;
		
		
		#endregion
		
		#region BOSS PESTE
		case "bossPeste - bolaMaior - cresce":
		part_type_shape(_tipo, pt_shape_sphere);
		part_type_size(_tipo, 0.05, 0.15, 0, 0);
		part_type_color_rgb(_tipo, 0, 100, 200, 255, 0, 100);
		part_type_alpha3(_tipo, 0, 1, 0);
		part_type_direction(_tipo, 0, 360, 0, 0);
		part_type_speed(_tipo, 3, 6, 0, 0);
		part_type_life(_tipo, 32, 48);
		
		part_emitter_region(_sistema, _emissor, x, x, y, y, ps_shape_ellipse, ps_distr_invgaussian);
		part_emitter_burst(_sistema, _emissor, _tipo, 1);
		break;
		
		case "bossPeste - bolaMaior - move":
		part_type_shape(_tipo, pt_shape_flare);
		part_type_size(_tipo, 0.1, 0.2, 0, 0);
		part_type_color_rgb(_tipo, 0, 100, 200, 255, 0, 100);
		part_type_alpha3(_tipo, 0, 1, 0);
		part_type_life(_tipo, 32, 48);
		
		part_emitter_region(_sistema, _emissor, bbox_left, bbox_right, bbox_top, bbox_bottom, ps_shape_ellipse, ps_distr_linear);
		part_emitter_burst(_sistema, _emissor, _tipo, 1);
		break;
		
		case "bossPeste - bolaMaior - explode":
		part_type_shape(_tipo, pt_shape_flare);
		part_type_size(_tipo, 0.1, 0.4, 0, 0);
		part_type_color_rgb(_tipo, 0, 100, 200, 255, 0, 100);
		part_type_alpha3(_tipo, 0, 1, 0);
		part_type_direction(_tipo, 0, 360, 0, 0);
		part_type_speed(_tipo, 2, 8, -0.01, 0);
		part_type_life(_tipo, 12, 64);
		
		part_emitter_region(_sistema, _emissor, bbox_left, bbox_right, bbox_top, bbox_bottom, ps_shape_ellipse, ps_distr_linear);
		part_emitter_burst(_sistema, _emissor, _tipo, 64);
		break;
		
		case "bossPeste - bolaMenor - move":
		part_type_shape(_tipo, pt_shape_flare);
		part_type_size(_tipo, 0.05, 0.1, 0, 0);
		part_type_color_rgb(_tipo, 0, 100, 200, 255, 0, 100);
		part_type_alpha3(_tipo, 0, 1, 0);
		part_type_life(_tipo, 32, 48);
		
		part_emitter_region(_sistema, _emissor, bbox_left, bbox_right, bbox_top, bbox_bottom, ps_shape_ellipse, ps_distr_linear);
		part_emitter_burst(_sistema, _emissor, _tipo, 1);
		break;
		
		case "bossPeste - bolaMenor - explode":
		part_type_shape(_tipo, pt_shape_flare);
		part_type_size(_tipo, 0.075, 0.2, -0.001, 0);
		part_type_color_rgb(_tipo, 0, 100, 200, 255, 0, 100);
		part_type_alpha3(_tipo, 0, 1, 0);
		part_type_direction(_tipo, 0, 360, 0, 0);
		part_type_speed(_tipo, 2, 6, -0.05, 0);
		part_type_life(_tipo, 12, 48);
		
		part_emitter_region(_sistema, _emissor, bbox_left, bbox_right, bbox_top, bbox_bottom, ps_shape_ellipse, ps_distr_gaussian);
		part_emitter_burst(_sistema, _emissor, _tipo, 32);
		break;
		
		case "bossPeste - grito":
		part_type_shape(_tipo, pt_shape_flare);
		part_type_size(_tipo, 0.075, 0.1, -0.001, 0);
		part_type_alpha3(_tipo, 0, 1, 0);
		part_type_direction(_tipo, 0, 360, 0, 0);
		part_type_speed(_tipo, 2, 6, 0, 0);
		part_type_life(_tipo, 12, 48);
		
		//part_emitter_region(_sistema, _emissor, x, x, lerp(bbox_bottom, bbox_top, 0.5), lerp(bbox_bottom, bbox_top, 0.5), ps_shape_ellipse, ps_distr_gaussian);
		part_emitter_region(_sistema, _emissor, _ox, _ox, _oy, _oy, ps_shape_ellipse, ps_distr_gaussian);
		part_emitter_burst(_sistema, _emissor, _tipo, 1);
		break;
		
		case "bossPeste - morrendo":
		part_type_shape(_tipo, pt_shape_sphere);
		part_type_size(_tipo, 0.05, 0.15, 0, 0);
		part_type_color2(_tipo, make_color_rgb(0, 200, 0), make_color_rgb(255,250,180));
		part_type_alpha3(_tipo, 0, 1, 0);
		part_type_direction(_tipo, 10, 170, 0, 0);
		part_type_speed(_tipo, 8, 16, 0, 0);
		part_type_life(_tipo,32, 64);
		
		part_emitter_region(_sistema, _emissor, bbox_left, bbox_right, bbox_top, bbox_bottom, ps_shape_ellipse, ps_distr_invgaussian);
		part_emitter_burst(_sistema, _emissor, _tipo, 8);
		break;
		#endregion
	
		#region PONTO HABILIDADE
		case "ponto_habilidade_desaparece":
		part_type_sprite(_tipo, spr_vfx_ponto_habilidade_desaparece, 1, 1, 0);
		part_type_scale(_tipo, 1, 1);
		//part_type_alpha1(_tipo, 1);
		part_type_life(_tipo, 32, 48);
		
		part_emitter_region(_sistema, _emissor, _ox, _ox, _oy, _oy, ps_shape_ellipse, ps_distr_gaussian);
		part_emitter_burst(_sistema, _emissor, _tipo, 1);
		break;
		#endregion
		
		#region vaso
		case "vaso_quebrando":
		part_type_shape(_tipo, pt_shape_square);
		part_type_size(_tipo, 0.01, 0.05, 0, 0);
		part_type_color_rgb(_tipo, 75, 150, 50, 75, 50, 75);
		part_type_alpha3(_tipo, 0, 1, 0);
		part_type_direction(_tipo, 45, 135, 0, 0);
		part_type_gravity(_tipo, 0.25, 270);
		part_type_speed(_tipo, 2, 4, 0, 0);
		part_type_life(_tipo, 24,32);
		
		part_emitter_region(_sistema, _emissor, _ox, _ox, _oy, _oy, ps_shape_ellipse, ps_distr_gaussian);
		part_emitter_burst(_sistema, _emissor, _tipo, 32);
		break;
		#endregion
		
	}
}