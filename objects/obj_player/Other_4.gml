ds_list_add(global.trajetoria, room);

if( ds_list_count(global.trajetoria, room) <= 1 and room == rm_fase_1_amb_1 ){
	save_game();
}

if( global.garoto ){
	instance_destroy(obj_garoto);
	var _garoto = instance_create_depth(x, y, depth + 1, obj_garoto);
	_garoto.seguindo = true;
}