switch etapa{
	case 0:
	alpha += 0.01;
	draw_set_alpha(alpha);
	draw_rectangle_color(0, 0, display_get_width(), display_get_height(), c_black, c_black, c_black, c_black, 0);
	
	if( alpha >= 1 ){
		etapa = 1;
	}
	break;
	
	case 1:
	draw_set_alpha(1);
	draw_rectangle_color(0, 0, display_get_width(), display_get_height(), c_black, c_black, c_black, c_black, 0);
	
	room_goto(to_room);
	
	if( player_ ){
		obj_player.x = player_x;
		obj_player.y = player_y;
	}
	
	if( room = to_room ){
		etapa = 2;
	}
	break;
	
	case 2:
	alpha -= 0.01;
	draw_set_alpha(alpha);
	draw_rectangle_color(0, 0, display_get_width(), display_get_height(), c_black, c_black, c_black, c_black, 0);
	
	if( alpha <= 0 ){
		global.interagindo = false;
		instance_destroy();
	}
	break;
}