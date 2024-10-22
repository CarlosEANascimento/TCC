switch estado {
    case 0:
        sprite_index = spr_curandeiro_bubonico_idle;
        if (!place_meeting(x, y + vspd, obj_bloco)) {
            vspd += 1;
        } else {
            vspd = 0;
        }
        
        move_and_collide(0, vspd, obj_bloco);
        
        if (alarm[0] <= 0) {
            image_xscale = choose(-1, 1);
            alarm[0] = irandom_range(120, 240);
        }
        
        if (distance_to_object(obj_player) < 512) {
            estado = 1;
        }
        break;
    
    case 1:
        sprite_index = spr_curandeiro_bubonico_idle;
        if (distance_to_object(obj_player) > 1) {
            image_xscale = (obj_player.x < x) ? 1 : -1 ;
        }
        
        if (!place_meeting(x, y + vspd, obj_bloco)) {
            vspd += 1;
        } else {
            vspd = 0;
        }
        
        move_and_collide(0, vspd, obj_bloco);
        
        if (alarm[1] <= 0) {
            ataque = 1;
            image_index = 0;
            estado = 2;
        }
        
        if (vida <= 0) {
            estado = 3;
            image_index = 0;
        }
        break;
    
    case 2:
        switch ataque {
            case 1:
                sprite_index = spr_curandeiro_bubonico_invocando;
                
                if (image_index >= sprite_get_number(sprite_index) - 1) {
                    repeat (irandom_range(2, 3)) {
                        instance_create_depth(x, y, obj_player.depth - 1, obj_rato_curandeiro);
                    }
                    ataque = 2;
                    image_index = 0;
                }
                break;
            
            case 2:
                sprite_index = spr_curandeiro_bubonico_carregando_ataque;
                
                if (image_index >= sprite_get_number(sprite_index) - 1) {
                    ataque = 3;
                    hit_box = instance_create_depth(x, y, obj_player.depth - 1, obj_hit_box_inimigos);
                    
                    image_xscale = (obj_player.x < x) ? -1 : 1;
                    hit_box.image_xscale = sign(image_xscale);
                    hit_box.dono = id;
                    hit_box.sprite = spr_curandeiro_bubonico_hit_box;
                    hit_box.dano = 50;
                    
                    hspd = distance_to_object(obj_player) / sprite_get_number(spr_curandeiro_bubonico_ataque);
                }
                break;
            
            case 3:
                move_and_collide(hspd * sign(image_xscale), 0, obj_bloco);
                sprite_index = spr_curandeiro_bubonico_ataque;
				if( sign(image_xscale) > 0 ){
					if( bbox_left > obj_player.x ) hspd = 0;
				}else{
					if( obj_player.x > bbox_right ) hspd = 0;
				}
                
                if (image_index >= sprite_get_number(sprite_index) - 1) {
                    ataque = 1;
                    estado = 1;
					hspd = 0;
                    alarm[1] = 120;
                }
                break;
        }
        break;
    
    case 3:
        sprite_index = spr_curandeiro_bubonico_morrendo;
        
        if (image_index >= sprite_get_number(sprite_index) - 1) {
            image_index = sprite_get_number(sprite_index) - 1;
            
            alpha -= 0.01;
        }
        
        if (alpha <= 0) {
			drop_itens(10 + (ds_list_count(global.trajetoria, room) - 1) * 1.5, 15 + (ds_list_count(global.trajetoria, room) - 1) * 1.5, obj_experiencia);
			drop_itens(10 + (ds_list_count(global.trajetoria, room) - 1) * 1.5, 15  + (ds_list_count(global.trajetoria, room) - 1) * 1.5, obj_vida);
			drop_itens(2 + (ds_list_count(global.trajetoria, room) - 1) * 1.5, 4 + (ds_list_count(global.trajetoria, room) - 1) * 1.5, obj_cura);
			particulas(0, 0, "morte");
            instance_destroy();
        }
        break;
}

if (!place_meeting(x, y + vspd, obj_bloco)) {
    vspd += 1;
} else {
    vspd = 0;
}

move_and_collide(0, vspd, obj_bloco);

image_xscale = (1 + ((ds_list_count(global.trajetoria, room) - 1)/10)) * sign(image_xscale);
image_yscale = (1 + ((ds_list_count(global.trajetoria, room) - 1)/10)) * sign(image_yscale);