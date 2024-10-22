var _x;
var _y;

switch etapa{
	case 0:
	_x = ( sign(obj_player.image_xscale) > 0 )? obj_player.bbox_right - 32 : obj_player.bbox_left + 32 ;
	_y = lerp(obj_player.bbox_bottom, obj_player.bbox_top, 0.5);
	
	if( distance_to_point(_x, _y) > 1 ) move_towards_point(_x, _y, distance_to_point(_x, _y)/5) else speed = 0;
	break;
	
	case 1:
	_x = instance_nearest(x, y, obj_totem_habilidade).x;
	_y = instance_nearest(x, y, obj_totem_habilidade).bbox_top + 34;
	move_towards_point(_x, _y, point_distance(x, y, _x, _y)/5);
	
	if(point_distance(x, y, _x, _y) <= 1){
		etapa++;
		speed = 0;
		global.interagindo = true;
	}
	break;
	
	case 2:
	draw_points_screen = true;
	etapa++;
	break;
}

ilu.x = x;
ilu.y = y;