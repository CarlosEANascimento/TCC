switch estado{
	case 0:
	if( distance_to_point(destiny_x, destiny_y) > 1 ){
		move_towards_point(destiny_x, destiny_y, abs((destiny_y - origem_y)/50))
	}else{
		speed = 0;
		particulas(x, y, "bossPeste - bolaMaior - cresce");
	}
	
	image_xscale += 0.005;
	image_yscale += 0.005;
	
	if(image_xscale == 1){
		obj_boss_peste.estado = 0;
		estado++;		
	}
	break;
	
	case 1:
	speed = 0;
	var _bola_veneno_menor;
	
	for( var _i = 1; _i <= 6; _i ++ ){
		_bola_veneno_menor = instance_create_depth(x, y, depth - 1, obj_boss_peste_bola_veneno_menor);
		_bola_veneno_menor.destiny_x = x + cos(_i) * 64;
		_bola_veneno_menor.destiny_y = y + sin(_i) * 64;
	}
	
	estado++;
	break;
	
	case 2:
	move_towards_point(obj_player.x, lerp(obj_player.bbox_bottom, obj_player.bbox_top, 0.5), 10);
	estado++;
	break;
	
	case 3:	
	particulas(x, y, "bossPeste - bolaMaior - move");
	break;
}

if( !audio_emitter_exists(emitter) ){
	emitter = audio_emitter_create();
	audio_play_sound_on(emitter, audio, 1, 0);
}else{
	audio_emitter_gain(emitter, clamp(1 - ((1/256) * distance_to_object(obj_player)), 0, 1));
}