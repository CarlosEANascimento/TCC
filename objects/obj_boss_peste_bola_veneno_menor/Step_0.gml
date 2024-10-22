switch estado{
	case 0:
	move_towards_point(destiny_x, destiny_y, 5);
	if( distance_to_point(destiny_x, destiny_y) < 1 ) estado++;
	break;
	
	case 1:
	move_towards_point(obj_player.x, lerp(obj_player.bbox_bottom, obj_player.bbox_top, 0.5), 3);
	if( irandom(1) < 1 ) particulas(x, y, "bossPeste - bolaMenor - move");
	
	if( place_meeting(x, y,  obj_player_hit_box) ){
		instance_destroy();
	}
	break;
}