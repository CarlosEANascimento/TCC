var _cam = view_camera[0];

var _cam_larg = camera_get_view_width(_cam);
var _cam_altu = camera_get_view_height(_cam);

var _player_x;

if( obj_player.hspd == 0 and obj_player.vspd == 0 and alarm[0] <= 0 ){
	alarm[0] = 360;
}else if( obj_player.hspd != 0 or obj_player.state != player_moving ){
	olhar_dir = false;
}

if(olhar_dir){
	_player_x = ( obj_player.image_xscale < 0 )? obj_player.bbox_left - 128 : obj_player.bbox_right + 128 ;
}else{
	_player_x = obj_player.x;
}

var _player_y = lerp(lerp(obj_player.bbox_bottom, obj_player.bbox_top, 0.8), y, 0.2);

var _cam_x = 0;
var _cam_y = 0;

move_towards_point(_player_x, _player_y, (olhar_dir)? round(distance_to_point(_player_x, _player_y)/32) : distance_to_point(_player_x, _player_y)/4 );

_cam_x = x - _cam_larg/2;
_cam_y = y - _cam_altu/2;

_cam_x = clamp(_cam_x, 0, room_width - _cam_larg);
_cam_y = clamp(_cam_y, 0, room_height - _cam_altu);

camera_set_view_pos(_cam, _cam_x, _cam_y);