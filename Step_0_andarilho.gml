image_alpha = alpha;

switch estado{
	case 0: //IDLE
	sprite_index = spr_andarilho_idle;
	
	if( distance_to_object(obj_player) <= 20 and alarm[0] <= 0 ){
		estado = 1;
		hit_box = instance_create_depth(x, y, obj_player.depth - 1, obj_hit_box_inimigos);
		
		image_xscale = (obj_player.x < x)? -1 : 1 ;
		hit_box.image_xscale = sign(image_xscale);
		hit_box.dono = id;
		hit_box.sprite = spr_andarilho_ataque_hit_box;
		hit_box.dano = 30;
		
		image_index = 0;
	}else{
		hspd = vel * dir;
		
		if( !place_meeting(x, y + vspd, obj_bloco) ){
			vspd += 1;
		}else{
			vspd = 0;
		}
		
		if( alarm[1] <= 0 ){
		 	dir *= -1;
			alarm[1] = irandom_range(240, 360);
		}
		
		image_xscale = sign(hspd);
		
		move_and_collide(hspd, vspd, obj_bloco);
	}
	
	if( vida <= 0 ){
		estado = 2;
		image_index = 0;
	}
	break;
	
	case 1: //ATAQUE
	sprite_index = spr_andarilho_ataque;
	image_xscale = (obj_player.x < x)? -1 : 1 ;
	
	if( image_index >= sprite_get_number(sprite_index) - 1 ){
		estado = 0;
		image_xscale = dir;
		image_index = 0;
		alarm[0] = 120;
		//dir = (obj_player.x < x)? -1 : 1 ;
	}
	break;
	
	case 2:
	sprite_index = spr_andarilho_morre;
	
	if( image_index >= sprite_get_number(sprite_index) - 1 ){
		image_index = sprite_get_number(sprite_index) - 1;
		alpha -= 0.01;
	}
	
	image_alpha = alpha;
	
	if( alpha <= 0 ){
		drop_itens(3 + (ds_list_count(global.trajetoria, room) - 1), 5 + (ds_list_count(global.trajetoria, room) - 1), obj_experiencia);
		drop_itens(3 + (ds_list_count(global.trajetoria, room) - 1), 5 + (ds_list_count(global.trajetoria, room) - 1), obj_vida);
		drop_itens(0 + (ds_list_count(global.trajetoria, room) - 1), 1 + (ds_list_count(global.trajetoria, room) - 1), obj_cura);
		particulas(0, 0, "morte");
		instance_destroy();
	}
	break;
}

image_xscale = (1 + ((ds_list_count(global.trajetoria, room) - 1)/10)) * sign(image_xscale);
image_yscale = (1 + ((ds_list_count(global.trajetoria, room) - 1)/10)) * sign(image_yscale);