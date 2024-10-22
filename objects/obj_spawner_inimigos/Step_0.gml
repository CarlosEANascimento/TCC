if( distance_to_object(obj_player) < 512 ){
	
//1 -> floresta
//2 -> peste

switch ambiente{
	#region Floresta
	case 1:
	break;
	#endregion
	
	#region Peste
	case 2:
	var _x1 = x;
	var _x2 = x + sprite_get_width(sprite_index) * image_xscale;
	var _region = _x2 - _x1;
	var _qt_inimigos = _region/200;
	
	repeat(_qt_inimigos){
		randomize();
		
		inimigo = choose(
			obj_andarilho, obj_andarilho, obj_andarilho, obj_andarilho, obj_andarilho,
			obj_andarilho, obj_andarilho, obj_andarilho, obj_andarilho, obj_andarilho,
			obj_ceifador, obj_ceifador, obj_ceifador, obj_ceifador, obj_ceifador,
			obj_ceifador, obj_ceifador, obj_ceifador, obj_ceifador, obj_ceifador,
			obj_mestre_da_peste, obj_mestre_da_peste, obj_mestre_da_peste, obj_mestre_da_peste, obj_mestre_da_peste,
			obj_mestre_da_peste, obj_mestre_da_peste, obj_mestre_da_peste, obj_mestre_da_peste, obj_mestre_da_peste,
			obj_slime_p, obj_slime_p, obj_slime_p,  obj_slime_p,  obj_slime_p, 
			obj_slime_m, obj_slime_m, obj_slime_m,  obj_slime_m,  obj_slime_m, 
			obj_slime_g,
			obj_curandeiro_bubonico
		);
		
		instance_create_depth(irandom_range(_x1, _x2), lerp(bbox_top, bbox_bottom, 0.5), depth, inimigo);
	}
	break;
	#endregion
}

instance_destroy();
}