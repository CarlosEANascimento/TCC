if( place_meeting(x, y, obj_player) and keyboard_check_pressed(ord("F")) and instance_exists(obj_ponto_habilidade) ){
	instance_find(obj_ponto_habilidade, 0).etapa++;
	global.interagindo = true;
}