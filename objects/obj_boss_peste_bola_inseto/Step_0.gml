switch estado{
	case 0:
	x += sin(num * multiplicador) * multiplicador;
	y += cos(num * multiplicador) * multiplicador;
	
	c_box_top     = collision_rectangle(bbox_left, bbox_top - 1, bbox_right, bbox_top, obj_bloco, 0, 1);
	c_box_right   = collision_rectangle(bbox_right, bbox_top, bbox_right + 1, bbox_bottom, obj_bloco, 0, 1);
	c_box_botttom = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom + 1, obj_bloco, 0, 1);
	c_box_left    = collision_rectangle(bbox_left - 1, bbox_top, bbox_left, bbox_bottom, obj_bloco, 0, 1);

	if(   c_box_top   ) vspd *= -1.00001;
	if( c_box_botttom ) vspd *= -1.00001;
	if(   c_box_left  ) hspd *= -1.00001;
	if(  c_box_right  ) hspd *= -1.00001;

	move_and_collide(hspd, vspd, obj_bloco);
	
	if( distance_to_object(obj_player) < 100 ){
		estado++;
		hspd = 0;
		vspd = 0;
	}
	break;
	
	case 1:
	sprite_index = choose(
	spr_boss_peste_bola_inseto_etapa_2_1,
	spr_boss_peste_bola_inseto_etapa_2_2
	);
	
	image_xscale = sprite_get_width(spr_boss_peste_bola_inseto_etapa_1)/256;
	image_yscale = sprite_get_height(spr_boss_peste_bola_inseto_etapa_1)/256;
	estado++;
	break;
	
	case 2:
	image_xscale += 0.2;
	image_yscale += 0.2;
	
	if( image_xscale >= 1 ){
		estado++;
		alarm[0] = 60;
	}
	break;
	
	case 3:
	image_alpha -= 0.1;
	if( alarm[0] <= 0 ) instance_destroy();
	break;
}

num++;