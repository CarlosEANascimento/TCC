if( distance_to_object(obj_player) < 512 ){
	
switch estado{
	case 0: //idle
	sprite_index = spr_mestre_da_peste_idle;
	image_xscale = ( x < obj_player.x )? -1 : 1 ; 
	
	if( distance_to_object(obj_player) > 128 ){
		alarm[0]++;
	}else if( alarm[0] <= 0 ){
		alarm[0] = 240;
	}
	
	if( alarm[1] <= 0 ){
		estado = 2;
		image_index = 0;
	}
	break;
	
	case 1: //teleporta
	var _x1, _x2;
	var _colisao;
	
	switch etapa{
		case 0: //some
		if( x < obj_player.x ){
			_x1 = obj_player.bbox_right;
			_x2 = ( obj_player.bbox_right + 512 > room_width )? room_width : obj_player.bbox_right + 512 ;
		}else{
			_x2 = obj_player.bbox_left;
			_x1 = ( obj_player.bbox_left - 512 < 0 )? 0 : obj_player.bbox_left - 512 ;
		}
		
		sprite_index = spr_mestre_da_peste_desaparece;
		
		if( image_index >= sprite_get_number(sprite_index) - 1 ){
			
			var _teleporta = false;
			
			var _destiny_x;
			do{
				_destiny_x = irandom_range(_x1, _x2);
				if( !place_meeting(_destiny_x, y, obj_bloco) ) _teleporta = true;
			}until(_teleporta)
			
			x = _destiny_x;
			image_index = 0;
			image_alpha = 0;
			etapa = 1;
		}
		break;
		
		case 1: //reaparece
		image_alpha = 1;
		sprite_index = spr_mestre_da_peste_reaparece;
		if( image_index >= sprite_get_number(sprite_index) - 1 ){
			image_index = 0;
			etapa = 0;
			estado = 0;
		}
		break;
	}
	break;
	
	case 2:
	sprite_index = spr_mestre_da_peste_invoca;
	
	if( image_index > 6 and image_index < 18 and irandom(39) < 1 ){
		instance_create_depth(irandom_range(x - 10, x + 10), irandom_range(y - 48, y - 32), depth - 1, obj_peste);
	}
	
	if( image_index >= sprite_get_number(sprite_index) - 1 ){
		image_index = 0;
		alarm[1] = 180;
		estado = 0;
	}
	break;
	
	case 3:
	sprite_index = spr_mestre_da_peste_desaparece;
	
	if(image_index >= sprite_get_number(sprite_index) - 1){
		drop_itens(5 + (ds_list_count(global.trajetoria, room) - 1), 8 + (ds_list_count(global.trajetoria, room) - 1), obj_experiencia);
		drop_itens(5 + (ds_list_count(global.trajetoria, room) - 1), 8 + (ds_list_count(global.trajetoria, room) - 1), obj_vida);
		drop_itens(0 + (ds_list_count(global.trajetoria, room) - 1), 1 + (ds_list_count(global.trajetoria, room) - 1), obj_cura);
		particulas(0, 0, "morte");
        instance_destroy();
	}
	break;
}

if( vida <= 0 ){
	estado = 3;
}

if (!place_meeting(x, y + vspd, obj_bloco)) {
    vspd += 1;
} else {
    hspd = 0;
    vspd = 0;
}

move_and_collide(hspd, vspd, obj_bloco);
	
}

image_xscale = (1 + ((ds_list_count(global.trajetoria, room) - 1)/10)) * sign(image_xscale);
image_yscale = (1 + ((ds_list_count(global.trajetoria, room) - 1)/10)) * sign(image_yscale);