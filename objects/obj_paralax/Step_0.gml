var _referencia_x = camera_get_view_x(view_camera[0]);
var _referencia_y = camera_get_view_y(view_camera[0]);

switch room_get_name(room){
	case "TESTE":
	var _layer_1 = layer_get_id("Backgrounds_1");
	var _layer_2 = layer_get_id("Backgrounds_2");
	var _layer_3 = layer_get_id("Backgrounds_3");
	var _layer_4 = layer_get_id("Backgrounds_4");
	var _layer_5 = layer_get_id("Backgrounds_5");
	var _layer_6 = layer_get_id("Backgrounds_6");
	var _layer_7 = layer_get_id("Backgrounds_7");
	var _layer_8 = layer_get_id("Backgrounds_8");
	var _layer_9 = layer_get_id("Backgrounds_9");
	
	layer_x(_layer_1, lerp(0, _referencia_x, 0.9));
	layer_x(_layer_2, lerp(0, _referencia_x, 0.8));
	layer_x(_layer_3, lerp(0, _referencia_x, 0.7));
	layer_x(_layer_4, lerp(0, _referencia_x, 0.6));
	layer_x(_layer_5, lerp(0, _referencia_x, 0.5));
	layer_x(_layer_6, lerp(0, _referencia_x, 0.4));
	layer_x(_layer_7, lerp(0, _referencia_x, 0.3));
	layer_x(_layer_8, lerp(0, _referencia_x, 0.2));
	layer_x(_layer_9, lerp(0, _referencia_x, 0.1));
	layer_x(_layer_1, lerp(0, _referencia_x, 0.9));
	
	layer_y(_layer_2, lerp(0, _referencia_y, 0.4));
	layer_y(_layer_3, lerp(0, _referencia_y, 0.35));
	layer_y(_layer_4, lerp(0, _referencia_y, 0.3));
	layer_y(_layer_5, lerp(0, _referencia_y, 0.25));
	layer_y(_layer_6, lerp(0, _referencia_y, 0.2));
	layer_y(_layer_7, lerp(0, _referencia_y, 0.15));
	layer_y(_layer_8, lerp(0, _referencia_y, 0.1));
	layer_y(_layer_9, lerp(0, _referencia_y, 0.05));
	break;
}