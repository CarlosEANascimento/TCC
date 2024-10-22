image_alpha = alpha;

switch estado{
	case 0: //IDLE
	sprite_index = spr_ceifador_idle;
	
	if( distance_to_object(obj_player) < 320 ){
		if( alarm[0] <= 0 ){
			image_index = 0;
			estado = 1;
		}
		
		if( distance_to_object(obj_player) > 1 ) image_xscale = ( obj_player. x < x )? -1 : 1 ;
	}else{
		if( alarm[1] <= 0 ){
			image_xscale = choose(1, -1);
			alarm[1] = irandom_range(120,240);
		}
	}
	
	if( vida <= 0 ) estado = 2;
	break;
	
	case 1:
	sprite_index = spr_ceifador_ataque;
	
	if( image_index >= sprite_get_number(sprite_index) - 1 ){
		instance_create_depth(x + 15 * sign(image_xscale), y - 54, obj_player.depth - 1, obj_disparo_veneno_ceifador);
		alarm[0] = 150;
		estado = 0;
	}
	break;
	
	case 2:
	sprite_index = spr_ceifador_morre;
	
	if( image_index >= sprite_get_number(sprite_index) - 1 ){
		image_index = sprite_get_number(sprite_index) - 1;
		
		alpha -= 0.01;
	}
	
	if( alpha <= 0 ){
		drop_itens(5 + (ds_list_count(global.trajetoria, room) - 1), 7 + (ds_list_count(global.trajetoria, room) - 1), obj_experiencia, lerp(bbox_left, bbox_right, 0.5), bbox_top);
		drop_itens(5 + (ds_list_count(global.trajetoria, room) - 1), 7 + (ds_list_count(global.trajetoria, room) - 1), obj_vida);
		drop_itens(0 + (ds_list_count(global.trajetoria, room) - 1), 1 + (ds_list_count(global.trajetoria, room) - 1), obj_cura);
		particulas(0, 0, "morte");
		instance_destroy();
	}
	break;
}

if( vida > 0 ){
	if( !place_meeting(x, y + vspd, obj_bloco) ){
		vspd += 1;
	}else{
		hspd = 0;
		vspd = 0;
	}

	move_and_collide(hspd, vspd, obj_bloco);
}

image_xscale = (1 + ((ds_list_count(global.trajetoria, room) - 1)/10)) * sign(image_xscale);
image_yscale = (1 + ((ds_list_count(global.trajetoria, room) - 1)/10)) * sign(image_yscale);