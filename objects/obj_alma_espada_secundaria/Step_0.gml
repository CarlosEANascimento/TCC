var _alvo = 0;

try
{
	if( !param ){
		if( obj_player_habilidade_3.etapa == 5 ){
			if( alarm[0] <= 0 ){
				image_angle = point_direction(x, y, alvo.x, lerp( alvo.bbox_bottom, alvo.bbox_top, 0.5));
				direction = point_direction(x, y, alvo.x, lerp( alvo.bbox_bottom, alvo.bbox_top, 0.5));
				speed = 30;
				param = true;
			}
		}
	}else{
		if( speed <= 0 ) image_alpha -= 0.01 else particulas(x, y, "hab3.2");
		if( image_alpha <= 0) instance_destroy();
	}
}
catch(_alvo)
{
	if( !param ){
		if( obj_player_habilidade_3.etapa == 5 ){
			if( alarm[0] <= 0 ){
				image_angle = point_direction(x, y, x, room_height);
				direction = point_direction(x, y, x, room_height);
				speed = 30;
				param = true;
			}
		}
	}else{
		if( speed <= 0 ) image_alpha -= 0.01 else particulas(x, y, "hab3.2");
		if( image_alpha <= 0) instance_destroy();
	}
}