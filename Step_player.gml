#region DEPENDENCIAS
check_and_create_obj_depth(obj_camera);
check_and_create_obj_depth(obj_paralax);
#endregion

#region CONTROLES
if( !global.interagindo ){
	btn_dir = keyboard_check(ord("D"));
	btn_esq = keyboard_check(ord("A"));
	btn_pulo = keyboard_check_pressed(vk_space);
	btn_dash = keyboard_check_pressed(vk_shift);
	btn_cura = mouse_check_button_pressed(mb_right);

	btn_atq = mouse_check_button_pressed(mb_left);
	btn_hab1 = keyboard_check_pressed(ord("Q"));
	btn_hab2 = keyboard_check_pressed(ord("E"));
	btn_hab3 = keyboard_check_pressed(ord("R"));
}
#endregion

#region VERIFICAR VALORES
pcs_cura = clamp(pcs_cura, 0, pcs_cura_max);
vida = clamp(vida, 0, vida_max);

if( instance_exists(obj_player_habilidade_3) ) hab3_buff = 0.5 else hab3_buff = 1;
#endregion	

if( vida > 0 ) script_execute(state);
gravidade();

pontos_habilidade = instance_number(obj_ponto_habilidade);

#region morte
if( vida <= 0 ){
	var _congelar = 0;
	with(all)
	{
		try{
			//image_speed = 0;
			hspd = 0;
			vspd = 0;
			obj_render_luz.luz_ambiente = c_black;
			global.mascara_sala = c_red;
		}catch(_congelar){
		}
	}
	sprite_index = spr_player_morte;
	
	if( image_index > sprite_get_number(spr_player_morte) - 1 ){
		image_index = sprite_get_number(spr_player_morte) - 1;
	}
	
	check_and_create_obj_depth(obj_reviver);
}
#endregion

if( room != rm_cutscene_1 and room != rm_menu_principal and room != rm_agradecimento){
	if(x < 0 or x > room_width or y < 0 or y > room_height and !instance_exists(obj_reviver)){ vida = 0 }
}

if( !place_empty(lerp(bbox_right, bbox_left, 0.5), lerp(bbox_top, bbox_bottom, 0.7), obj_bloco)){
	 audio_stop_sound(snd_pulo_aterrisa);
	 audio_stop_sound(snd_pulo_subindo);
}

if( place_meeting(x, y, obj_bloco) ){
	x = xprevious;
	y = yprevious;
} 

//if( instance_exists(obj_transicao) ){
//	audio_sound_gain(global.trilha_sonora, obj_transicao.alpha, 0);
//}else{
//	audio_sound_gain(global.trilha_sonora, 1, 0);
//}

#region TESTES

#endregion
