function player_moving(){
	#region SPRITES
	if( (btn_dir or btn_esq) and !(btn_dir and btn_esq) and place_meeting(x, y + 1, obj_bloco) ){
		sprite_index = spr_player_corre;
		image_xscale = btn_dir - btn_esq;
	}else if( hspd == 0 and !(btn_dir and btn_esq) ){
		sprite_index = spr_player_idle;
	}
	
	if( !place_meeting(x, y + 1, obj_bloco) ){
		if( round(vspd) < 0 ) sprite_index = spr_player_pulo_sub;
		if( round(vspd) == 0 ) sprite_index = spr_player_pulo_max;
		if( round(vspd) > 0 ) sprite_index = spr_player_pulo_desc;
	}
	#endregion
	
	#region EFEITOS SONOROS
	if( hspd != 0 and place_meeting(x, y + 1, obj_bloco) and !audio_is_playing(snd_passos) ){
		audio_play_sound(snd_passos, 1, 1);
	}else if(hspd != 0 and place_meeting(x, y + 1, obj_bloco) and audio_is_playing(snd_passos)){
		audio_sound_gain(snd_passos, abs(hspd/max_vel), 0);
	}else if( hspd == 0 or !place_meeting(x, y + 1, obj_bloco) and audio_is_playing(snd_passos) ){
		//audio_pause_sound(snd_passos);
		audio_stop_sound(snd_passos);
	}
	#endregion
	
	#region MOVIMENTAÇÃO HORIZONTAL
	if( btn_dir and hspd >= 0 ){
		hspd += ((hspd + acel) < max_vel)? acel : max_vel - hspd ;
	}else if( btn_dir and hspd < 0 ){
		hspd += ((hspd + acel) < 0)? acel * 1.5 : 0 - hspd ;
	}else if( !btn_dir and !btn_esq and hspd > 0 ){
		hspd -= ((hspd - acel) > 0)? acel * 2 : hspd ;
	}
	
	if( btn_esq and hspd <= 0 ){
		hspd -= ((hspd - acel) > max_vel * -1)? acel : max_vel + hspd ;
	}else if(btn_esq and hspd > 0){
		hspd -= ((hspd - acel) > 0)? acel * 1.5 : hspd ;
	}else if(!btn_dir and !btn_esq and hspd < 0){
		hspd += ((hspd + acel) < 0)? acel * 2 : 0 - hspd ;
	}
	
	move_and_collide((place_meeting(x, y + 1, obj_bloco))? hspd : hspd * 0.75  , 0, obj_bloco);
	#endregion
	
	#region GRAVIDADE E PULO
	if(btn_pulo and place_meeting(x, y + 1, obj_bloco)){
		vspd -= 15;
		particulas(x, y, "PULO");
		audio_play_sound(snd_pulo_subindo, 1, 0);
	}
	
	move_and_collide(0, vspd, obj_bloco);
	#endregion
	
	#region COMBATE
	if( btn_cura and pcs_cura > 0 ){
		vida += ( alarm[1] <= 0 )? 20 : 10 ;
		pcs_cura--;
		particulas(x, y, "cura");
		alarm[1] = 60;
	}
	
	if( btn_dash and alarm[0] <= 0 ){ //DASH
		
		for( var _i = 256; _i > 0; _i-- ){
			colisao_dash = collision_rectangle(( sign(image_xscale) > 0 )? bbox_right : bbox_left , bbox_top, ( sign(image_xscale) > 0 )? bbox_right + _i * sign(image_xscale) : bbox_left + _i * sign(image_xscale), bbox_bottom - 1, obj_bloco, 1, 1);
			
			if( colisao_dash ){
				continue;
			}else{
				x += _i * sign(image_xscale);
				particulas(0, 0, "dash");
				alarm[0] = 120;
				exit;
			}
		}
	}
	
	if( btn_atq ){
		if( instance_exists(obj_player_hit_box) ){
			instance_destroy(instance_find(obj_player_hit_box, 0));
			hit_box = instance_create_depth(x, y, depth - 1, obj_player_hit_box);
		}else{
			hit_box = instance_create_depth(x, y, depth - 1, obj_player_hit_box);
		}
		
		hit_box.ataque = ( place_meeting(x, y + 1, obj_bloco) )? 0 : 0.5 ;
		
		hspd = 0;
		image_index = 0;
		state = player_ataque_basico;
	}
	
	if( btn_hab1 and alarm[8] <= 0 ){
		image_index = 0;
		state = player_habilidade_1;
	}
	
	if( btn_hab2 and alarm[9] <= 0 and !instance_exists(obj_player_habilidade_2) ){
		instance_create_depth(x, lerp(bbox_bottom, bbox_top, 0.5), depth, obj_player_habilidade_2);
	}
	
	if( btn_hab3 and alarm[10] <= 0 and !instance_exists(obj_player_habilidade_3) ){
		instance_create_depth(0, 0, depth, obj_player_habilidade_3);
		//state = player_habilidade_3;
	}
	#endregion
}

function player_ataque_basico(){
	sprite_index = ( place_meeting(x, y + 1, obj_bloco) )? spr_player_ataque : spr_player_ataque_ar ;
	
	if( image_index >= sprite_get_number(sprite_index) - 1 ){
		image_index = 0;
		sprite_index = spr_player_idle;
		state = player_moving;
		instance_destroy(hit_box);
	}
}

function player_habilidade_1(){
	sprite_index = spr_player_ataque;
	gravidade();
	
	if( image_index > 3.00 and instance_number(obj_player_hit_box) < 1 ){
		hit_box = instance_create_depth(x, lerp(bbox_bottom, bbox_top, 0.5), depth, obj_player_hit_box);
		hit_box.ataque = "hab1";
	}
	
	if( image_index >= sprite_get_number(sprite_index) - 1 ){
		sprite_index = spr_player_idle;
		image_index = 0;
		alarm[8] = global.colldown_hab1;
		state = player_moving;
	}
}

function player_estatico (){
	
}