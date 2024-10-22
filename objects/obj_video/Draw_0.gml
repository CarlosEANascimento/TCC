var _video_data = video_draw();
var _video_status =	_video_data[0];
if( _video_status == 0 ){
	draw_surface_stretched(_video_data[1], 0, 0, room_width, room_height);
}

if( video_get_position() >= video_get_duration() - 150 ){
	obj_player.vspd = 0;
	obj_player.hspd = 0;
	
	if( !layer_exists("UPPER") ){
		layer_create(layer_get_depth("Instances"), "UPPER");
	}
	
	var _tran = instance_create_depth(0 ,0 ,depth, obj_transicao);
	_tran.destiny = rm_fase_1_amb_1;
	_tran.destiny_x = 100;
	_tran.destiny_y = 500;
}