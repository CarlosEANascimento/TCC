switch etapa{
	case 0:
	
	if( !audio_emitter_exists(emitter) ){
		emitter = audio_emitter_create();
		audio_play_sound_on(emitter, audio, 1, 0);
	}else{
		audio_emitter_gain(emitter, clamp(1 - ((1/256) * distance_to_object(obj_player)), 0, 1));
	}
	particulas(x, y, "bossPeste - bolaMenor - move");
	break;
	
	case 1:
	sprite_index = spr_nuvem_veneno_ceifador;
	image_alpha -= 0.01;
	
	if(image_alpha <= 0) instance_destroy();
	break;
}

var _luz;

try{
	ilu.x = x;
	ilu.y = y;
	ilu.image_alpha = image_alpha * 0.7;
}catch(_luz){
	instance_destroy(ilu);
}

image_xscale = (1 + ((ds_list_count(global.trajetoria, room) - 1)/10)) * sign(image_xscale);
image_yscale = (1 + ((ds_list_count(global.trajetoria, room) - 1)/10)) * sign(image_yscale);