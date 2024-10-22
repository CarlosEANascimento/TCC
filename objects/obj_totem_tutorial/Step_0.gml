var _dialogo;

if( distance_to_object(obj_player) < 128 and keyboard_check_pressed(ord("F")) and !instance_exists(obj_dialogo) ){
	interagindo = true;
	global.interagindo = true;
	
	_dialogo = instance_create_depth(0, 0, depth, obj_dialogo);
	_dialogo.npc = "tutorial";
	_dialogo.conversa = 0;
}