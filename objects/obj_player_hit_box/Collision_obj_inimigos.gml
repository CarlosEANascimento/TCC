//var _so_pa_roda;

//try
//{
	if( ds_list_find_index(inimigos_atingidos, other) == -1 and other.hit ){
		ds_list_add(inimigos_atingidos, other);
		var _dano = dano + (dano * global.nvl_forca/50);
		audio_play_sound(snd_acerto_inimigo, 1, 0);
	
		other.vida -= _dano * obj_player.hab2_buff * obj_player.hab3_buff;
		if( other.vida <= 0 ){
			particulas(0, 0, "blood_impact", other.bbox_left, other.bbox_right, other.bbox_top, other.bbox_bottom);
		}else{
			particulas(0, 0, "impact", other.bbox_left, other.bbox_right, other.bbox_top, other.bbox_bottom);
		}
		obj_player.hab2_buff = 1;
	}
//}
//catch(_so_pa_roda)
//{
//	if( ds_list_find_index(inimigos_atingidos, other) == -1){
//		ds_list_add(inimigos_atingidos, other);
//		var _dano = dano + (dano * global.nvl_forca/50);
//		audio_play_sound(snd_acerto_inimigo, 1, 0);
	
//		other.vida -= _dano * obj_player.hab2_buff * obj_player.hab3_buff;
//		if( other.vida <= 0 ){
//			particulas(0, 0, "blood_impact", other.bbox_left, other.bbox_right, other.bbox_top, other.bbox_bottom);
//		}else{
//			particulas(0, 0, "impact", other.bbox_left, other.bbox_right, other.bbox_top, other.bbox_bottom);
//		}
//		obj_player.hab2_buff = 1;
//	}
//}