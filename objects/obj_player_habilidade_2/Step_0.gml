var _sin = sin(sin_num * 0.05);

image_alpha = 0.8 * _sin ;
depth = obj_player.depth - 1;

if( (0.8 * _sin) <= 0 and etapa == 1 ){
	instance_destroy();
}else if( (0.8 * _sin) <= 0 ){
	etapa++;
}

if(obj_player.vida < 1 ) obj_player.vida = 1;

sin_num++;