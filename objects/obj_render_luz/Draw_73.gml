if( !surface_exists(surf_luz) ){
	var _larg = surface_get_width(application_surface);
	var _altu = surface_get_height(application_surface);
	surf_luz = surface_create(_larg, _altu, surface_rgba16float);
}

var _cam = camera_get_active();
var _cam_x = camera_get_view_x(_cam);
var _cam_y = camera_get_view_y(_cam);
var _cam_larg = camera_get_view_width(_cam);
var _cam_altu = camera_get_view_height(_cam);

surface_set_target(surf_luz);
	draw_clear(luz_ambiente);
	camera_apply(view_camera[0]);
	
	gpu_set_blendmode(bm_add);
	
	with(obj_fonte_luz){ if( distance_to_object(obj_player) < 758 ) draw_self(); }
	with(obj_passagem){ if( distance_to_object(obj_player) < 758 )  draw_self(); }
	
	var _mascara_sala;
	
	try{
		_mascara_sala = global.mascara_sala;
	}catch(_mascara_sala){
		_mascara_sala = make_color_rgb(200,200,200);
	}
	
	draw_sprite_ext(spr_luz_ambiente, 0, _cam_x + _cam_larg/2, _cam_y + _cam_altu/2,
	camera_get_view_width(view_camera[0])/sprite_get_width(spr_luz_ambiente), camera_get_view_height(view_camera[0])/sprite_get_height(spr_luz_ambiente),
	0, _mascara_sala, 1);
	
	gpu_set_blendmode(bm_normal);
surface_reset_target();