if( place_meeting(x, y, obj_player) and keyboard_check_released(vk_enter) and !instance_exists(obj_boss_peste) ){
	if( !layer_exists("UPPER") ){
		layer_create(layer_get_depth("Instances"), "UPPER");
	}
	
	var _tran = instance_create_depth(0 ,0 ,depth, obj_transicao);
	_tran.destiny = destiny;
	_tran.destiny_x = destiny_x;
	_tran.destiny_y = destiny_y;
}