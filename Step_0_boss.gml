//alarm[] = colldown geral das habilidades
//alarm[] = colldown bola de veneno -> 1
//alarm[] = colldown invocar seres -> 2
//alarm[] = colldown projeteis -> 3
//alarm[] = colldown bola inseto -> 4
//alarm[] = colldown onda de choque -> 5
//alarm[] = colldown grito -> 6
//alarm[] = paciencia

switch estado{
	#region PERSEGUIR -> 0
	case 0:
	randomize();
	if( hspd != 0 ){
		sprite_index = sprites.mov;
	}else{
		sprite_index = sprites.idle;
	}
	
	if( distance_to_object(obj_player) > 256 ){
		switch fase{
			case 1:
			habilidade = choose(3, 5);
			
			if( alarm[0] <= 0 ){
				image_index = 0;
				estado = habilidade;
			}
			break;
			
			case 2:
			habilidade = choose(3, 5, 6, 7);
			
			if( alarm[0] <= 0 ){
				image_index = 0;
				estado = habilidade;
			}
			break;
			
			case 3:
			habilidade = choose(3, 5, 6, 7, 7);
			
			if( alarm[0] <= 0 ){
				image_index = 0;
				estado = habilidade;
			}
			break;
		}
	}else{
		habilidade = choose(2, 4, 5);
		
		if( alarm[0] <= 0 ){
			image_index = 0;
			estado = habilidade;
		}
	}
	
	hspd = ( obj_player.x < x and distance_to_point(obj_player.x,obj_player.y) > 1 )? -1 * vel : vel ;
	
	if( distance_to_object(obj_player) > 1 ){
		hspd = ( obj_player.x < x )? -1 * vel : vel ;
	}else{
		hspd = 0;
	}
	
	image_xscale = ( obj_player.x < x and distance_to_point(obj_player.x,obj_player.y) > 1 )? -1 : 1 ;
	
	move_and_collide(hspd, 0, obj_bloco);
	break;
	#endregion
	
	#region SURGIMENTO -> 1
	case 1:
	if( distance_to_object(obj_totem_boss) > 128 and instance_exists(obj_totem_boss) ){
        gravidade(1, obj_null, 1);
    } else {
        gravidade();
        if( place_meeting(x, y + 1, obj_bloco) ){
            estado = 2;
            image_index = 0;
        }
    }
	break;
	#endregion
	
	#region GRITO -> 2
	case 2:
	if( !audio_emitter_exists(emitter) ){
		emitter = audio_emitter_create();
		audio_play_sound_on(emitter, snd_boss_peste_grito,0,0);
	}
	
	if( !audio_is_playing(snd_boss_peste_grito) ) audio_play_sound(snd_boss_peste_grito, 0, 0);
	
	sprite_index = sprites.grito;
	image_xscale += sin(num * 1.5) * 0.1;
    image_yscale += sin(num * 1.5) * 0.1;
	
	if( !instance_exists(obj_boss_peste_grito) ) habilidade = instance_create_depth(x, lerp(bbox_bottom, bbox_top, 0.5), depth - 1, obj_boss_peste_grito);
	
	if( image_index >= sprite_get_number(sprite_index) - 1 ){
		instance_destroy(habilidade);
		obj_player.speed = 0;
        image_xscale = 1;
        image_yscale = 1;
		alarm[0] = 180;
		estado = 0;
		if( audio_emitter_exists(emitter) ) audio_emitter_free(emitter);
	}
	break;
	#endregion
	
	#region BOLAS DE VENENO -> 3
	case 3:
	sprite_index = sprites.bola_veneno;
	
	if( !instance_exists(obj_boss_peste_bola_veneno_maior) ){
		habilidade = instance_create_depth(x, lerp(bbox_bottom, bbox_top, 0.5), depth - 1, obj_boss_peste_bola_veneno_maior);
        habilidade.destiny_x = x;
        habilidade.destiny_y = y - 320;
        habilidade.origem_y = y;
	}
	
	if( image_index >= sprite_get_number(sprite_index) - 1 ){
		image_index = 0;
		alarm[0] = 180;
		estado = 0;
	}
	break;
	#endregion
	
	#region ONDA DE CHOQUE -> 4
	case 4:
	sprite_index = sprites.onda_choque;
	
	if( image_index >= sprite_get_number(sprite_index) - 1 ){
		var _onda1 = instance_create_depth(x, y, depth + 1, obj_boss_peste_onda_choque);
		_onda1.dir = 1;
		
		var _onda2 = instance_create_depth(x, y, depth + 1, obj_boss_peste_onda_choque);
		_onda2.dir = -1;
		
		alarm[0] = 180;
		image_index = 0;
		estado = 0;
	}
	break;
	#endregion
	
	#region INVOCAR SERES -> 5
	case 5:
	sprite_index = sprites.invoca;
	
	if( image_index >= sprite_get_number(sprite_index) - 1 ){
		repeat( irandom_range(2, 4) ){
			instance_create_depth(x, y, depth - 1, obj_boss_peste_seres);
		}
		
		alarm[0] = 180;
		image_index = 0;
		estado = 0;
	}
	break;
	#endregion
	
	#region PROJETEIS -> 6
	case 6:
	sprite_index = sprites.invoca;
	
	if( image_index >= sprite_get_number(sprite_index) - 1 ){
		var _projetil;
		
		repeat( irandom_range(3, 6) ){
			switch irandom_range(1, 3){
				case 1: //PAREDE DIREITA
				_projetil = instance_create_depth(obj_sala_boss.bbox_right, irandom_range(bbox_top, obj_sala_boss.bbox_bottom), depth, obj_boss_peste_projeteis);
				_projetil.destiny_x = obj_sala_boss.bbox_left;
				_projetil.destiny_y = _projetil.y;
				_projetil.origem = 1;
				break;
			
				case 2: //PAREDE ESQUERDA
				_projetil = instance_create_depth(obj_sala_boss.bbox_left, irandom_range(bbox_top, obj_sala_boss.bbox_bottom), depth, obj_boss_peste_projeteis);
				_projetil.destiny_x = obj_sala_boss.bbox_right;
				_projetil.destiny_y = _projetil.y;
				_projetil.origem = 2;
				break;
			
				case 3: //TETO
				_projetil = instance_create_depth(irandom_range(obj_sala_boss.bbox_left + 64, obj_sala_boss.bbox_right - 64), obj_sala_boss.bbox_top, depth, obj_boss_peste_projeteis);
				_projetil.destiny_x = _projetil.x;
				_projetil.destiny_y = obj_sala_boss.bbox_bottom;
				_projetil.origem = 3;
				break;
			}
		}
		
		alarm[0] = 60;
		estado = 0;
	}
	break;
	#endregion
	
	#region BOLAS INSETO -> 7
	case 7:
	sprite_index = sprites.invoca;
	
	if( image_index >= sprite_get_number(sprite_index) - 1 ){
		repeat( irandom_range(2, 4) ){
			instance_create_depth(
			irandom_range(obj_sala_boss.bbox_right + 128, obj_sala_boss.bbox_left - 128),
			irandom_range(obj_sala_boss.bbox_top + 128, obj_sala_boss.bbox_bottom),
			depth, obj_boss_peste_bola_inseto
			);
		}
		
		alarm[0] = 60;
		estado = 0;
	}
	break;
	#endregion
	
	#region MORTE -> 8
	case 8:
	switch etapa{
		case 0:
		sprite_index = sprites.grito;
		image_xscale += sin(num * 1.5) * 0.1;
	    image_yscale += sin(num * 1.5) * 0.1;
	
		if( !instance_exists(obj_boss_peste_grito) ) habilidade = instance_create_depth(x, lerp(bbox_bottom, bbox_top, 0.5), depth - 1, obj_boss_peste_grito);
		particulas(x, y, "bossPeste - morrendo");
	
		if( image_index >= sprite_get_number(sprite_index) - 1 ){
			instance_destroy(habilidade);
			obj_player.speed = 0;
	        image_xscale = 1;
	        image_yscale = 1;
			etapa = 1;
		}
		break;
		
		case 1:
		drop_itens(20 + (ds_list_count(global.trajetoria, room) - 1) * 2, 25 + (ds_list_count(global.trajetoria, room) - 1) * 2, obj_experiencia);
		drop_itens(25 + (ds_list_count(global.trajetoria, room) - 1) * 2, 30 + (ds_list_count(global.trajetoria, room) - 1) * 2, obj_vida);
		drop_itens(5 + (ds_list_count(global.trajetoria, room) - 1) * 2, 8 + (ds_list_count(global.trajetoria, room) - 1) * 2, obj_cura);
		particulas(x, y, "morte");
		audio_sound_gain(global.trilha_sonora, 0, 60);
		global.trilha_sonora = audio_play_sound(snd_trilha_1, 1, 1);
		instance_destroy();
		
		if( obj_player.vida > 0 ) obj_player.alarm[2] = 120;
		break;
	}
	break;
	#endregion
}

#region TRANSIÇÃO DE FASE
if( vida <= 0 ){
    fase++;
    
    switch fase{
        case 2:
	    vida = vida_fase2;
	    sprites = sprites_etapa2;
		image_index = 0;
	    estado = 2;
	    break;
        case 3:
        vida = vida_fase3;
        sprites = sprites_etapa3;
		image_index = 0;
        estado = 2;
        break;
		case 4:
		image_index = 0;
		estado = 8;
		break;
    }
}
#endregion

image_xscale = (1 + ((ds_list_count(global.trajetoria, room) - 1)/10)) * sign(image_xscale);
image_yscale = (1 + ((ds_list_count(global.trajetoria, room) - 1)/10)) * sign(image_yscale);

num++;