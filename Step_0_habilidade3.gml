depth -= 100;

switch etapa{
	case 0:
	window_set_cursor(cr_none);
	cursor_sprite = spr_ponteiro;
	
	if( mouse_check_button_pressed(mb_left) ){
		etapa++;
		cursor_sprite = cr_arrow;
		ponto_x = mouse_x;
		ponto_y = mouse_y;
	}
	
	if( mouse_check_button_pressed(mb_right) ){
		cursor_sprite = noone;
		window_set_cursor(cr_arrow);
		instance_destroy();
	}
	break;

	case 1:
	window_set_cursor(cr_arrow);
	obj_player.alarm[10] = global.colldown_hab3;
	//cursor_sprite = ;
	origem_x = lerp(obj_player.bbox_left, obj_player.bbox_right, 0.5);
	origem_y = lerp(obj_player.bbox_bottom, obj_player.bbox_top, 0.5);
	x = origem_x;
	y = origem_y;
	sprite_index = spr_alma_espada_principal;
	etapa++;
	break
	
	case 2:
	move_towards_point(ponto_x, ponto_y, 10);
	particulas(x, y, "hab3 - etapa2");
	image_angle = round(point_direction(origem_x, origem_y, ponto_x, ponto_y));
	
	if(distance_to_point(ponto_x, ponto_y) < 1){
		etapa++;
	}
	break;
	
	case 3:
	speed = 0;
	
	if( image_angle < 0 ) image_angle = 360;
	if( image_angle > 360 ) image_angle = 0;
	
	if( image_angle < 90 or image_angle > 270 ) image_angle-= 3;
	if( image_angle > 90 and image_angle < 270 ) image_angle+= 3;
	
	if( image_angle == 270 ){
		etapa++;
	}
	break;
	
	case 4:
	image_alpha = 0;
	
	for( var _i = 0; _i < instance_number(obj_inimigos); _i++ ){
		inimigos[_i] = instance_find(obj_inimigos, _i);
		if( distance_to_object(inimigos[_i]) < alcance ){
			ds_list_add(alvos, inimigos[_i]);
		}
	}
	
	
	repeat(qt_espadas){
		espada_pos_x = (x - alcance/2) + ((alcance/qt_espadas) * index_espada );
		
		espadas[index_espada] = instance_create_depth(espada_pos_x, y, depth - 1, obj_alma_espada_secundaria);
		espadas[index_espada].alvo= alvos[| index_alvo];
		index_alvo++;
		index_espada++;
		
		if( index_alvo >= ds_list_size(alvos) ) index_alvo = 0;
	}
	
	particulas(x, y, "hab3 - etapa3");
	etapa++;
	break;
	
	case 5:
	if( !place_meeting(x, y + (sprite_get_width(spr_alma_espada_principal) * 0.75), obj_bloco) ){
		vspd++;
	}else{
		vspd = 0;
	}
	
	move_and_collide(0, vspd, obj_bloco);
	if( !instance_exists(obj_alma_espada_secundaria) ){
		etapa++;
	}
	break;
	
	case 6:
	instance_destroy();
	break;
}