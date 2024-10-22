function gravidade( _grv = 1, _objeto = obj_bloco, _aplicar = true ){
	if( !place_meeting(x, y + vspd, _objeto) ){
		vspd += _grv;
	}else{
		vspd = 0;
	}
	
	if(_aplicar) move_and_collide(0, vspd, _objeto);
}

function check_and_create_obj_depth(_obj, _x = 0, _y = 0, _depth = depth){
	if( !instance_exists(_obj) ) var _inst = instance_create_depth(_x, _y, _depth, _obj);
}

function check_and_create_obj_layer(_obj, _x = 0, _y = 0, _layer = layer_get_name(layer)){
	if( !instance_exists(_obj) ) instance_create_layer(_x, _y, layer_get_id(_layer), _obj);
}

function end_animation(_sprite){
	if( image_index >= sprite_get_number(_sprite) - 1 ){
		return true
	}else{
		return false;		
	}
}

function drop_itens(_qt_min, _qt_max, _item, _x = lerp(bbox_left, bbox_right, 0.5), _y = lerp(bbox_top, bbox_bottom, 0.5)){
	repeat( irandom_range(_qt_min, _qt_max) ){
		instance_create_depth(_x, _y, obj_player.depth - 1, _item);
	}
}

function collect_itens_sound(){
	audio_play_sound(choose(snd_pegar_item1, snd_pegar_item2, snd_pegar_item3), 0, 0);
}

function relative_distance_sound(_sound, _max_distance, _relative_to){
	if( !audio_is_playing(_sound) ) audio_play_sound(_sound, 0, 1);
	audio_sound_gain(_sound, abs((1/_max_distance)*distance_to_object(_relative_to)), 0);
}

function reset_draw_settings(){
	gpu_set_blendmode(bm_normal);
	draw_set_alpha(1);
	draw_set_color(-1);
	draw_set_font(-1);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
}

function transition_border_color() {
    var _border_color_start = make_color_rgb(50, 50, 50);
    var _border_color_end = make_color_rgb(255, 0, 0);
    var _transition_duration = 60; // Número de quadros que a transição deve durar
    var _transition_progress = 0;  // Inicialmente, a transição não começou

    // Função de interpolação linear (lerp)
    function lerp(_a, _b, _t) {
        return _a + (_b - _a) * _t;
    }

    if (_transition_progress < _transition_duration) {
        _transition_progress++;
        var _ratio = _transition_progress / _transition_duration;
        var _r = lerp(color_get_red(_border_color_start), color_get_red(_border_color_end), _ratio);
        var _g = lerp(color_get_green(_border_color_start), color_get_green(_border_color_end), _ratio);
        var _b = lerp(color_get_blue(_border_color_start), color_get_blue(_border_color_end), _ratio);
        var _new_border_color = make_color_rgb(_r, _g, _b);

        // Aplique a nova cor à borda
        // Substitua "self" pelo objeto que possui as bordas a serem coloridas.
        obj_render_luz.luz_ambiente = _new_border_color;
    }
}

function save_game(){
	ini_open(global.save_name + ".sav");
	
	ini_write_real("Player", "x", obj_player.x);
	ini_write_real("Player", "y", obj_player.y);
	ini_write_real("Player", "vida", obj_player.vida);
	ini_write_real("Player", "room", room);
	ini_write_real("Player", "level", obj_player.nivel);
	ini_write_real("Player", "forca", global.nvl_forca);
	ini_write_real("Player", "defesa", global.nvl_defesa);
	ini_write_real("Player", "vitalidade", global.nvl_vida);
	ini_write_real("Player", "garoto", global.garoto );
	ini_write_real("Player", "experiencia", obj_player.experiencia );
	
	
	ini_write_real("Trajetoria", "num", ds_list_size(global.trajetoria));
	for( var _i = 0; _i < ds_list_size(global.trajetoria); _i++ ){
		ini_write_real("Trajetoria", string(_i), global.trajetoria[|_i]);
	}
	
	ini_close();
}

//function load_game(_save_name){
//	ini_open(_save_name + ".sav");
	
//	obj_player.x      = round( ini_read_real("Player", "x", 0)          );
//	obj_player.y      = round( ini_read_real("Player", "y", 0)          );
//	obj_player.vida   = round( ini_read_real("Player", "vida", 100)     );
//	obj_player.nivel  = round( ini_read_real("Player", "level", 1)      );
//	global.nvl_forca  = round( ini_read_real("Player", "forca", 1)      );
//	global.nvl_defesa = round( ini_read_real("Player", "defesa", 1)     );
//	global.nvl_vida   = round( ini_read_real("Player", "vitalidade", 1) );
//	global.save_name  = _save_name;
//	obj_player.vida_max += global.nvl_vida * 10;
	
//	for( var _i = 0; _i < round(ini_read_real("Trajetoria", "num", 1)); _i++ ){
//		ds_list_add(global.trajetoria, ini_read_real("Trajetoria", string(_i), 0));
//	}
	
//	if( round(ini_read_real("Player", "garoto", 0)) == 1 ) global.garoto = true; else global.garoto = false;
	
	
//	ini_close();
//}

function load_game(_save_name){
    ini_open(_save_name + ".sav");
    
    obj_player.x      = round( ini_read_real("Player", "x", 0)          );
    obj_player.y      = round( ini_read_real("Player", "y", 0)          );
    obj_player.vida   = round( ini_read_real("Player", "vida", 100)     );
    obj_player.nivel  = round( ini_read_real("Player", "level", 1)      );
    global.nvl_forca  = round( ini_read_real("Player", "forca", 1)      );
    global.nvl_defesa = round( ini_read_real("Player", "defesa", 1)     ); // Corrigido aqui
    global.nvl_vida   = round( ini_read_real("Player", "vitalidade", 1) );
    global.save_name  = _save_name;
    obj_player.vida_max = 100 + global.nvl_vida * 10; // Corrigido aqui
    
    for( var _i = 0; _i < round(ini_read_real("Trajetoria", "num", 1)); _i++ ){
        ds_list_add(global.trajetoria, ini_read_real("Trajetoria", string(_i), 0));
    }
    
    if( round(ini_read_real("Player", "garoto", 0)) == 1 ) global.garoto = true; else global.garoto = false;
    
    ini_close();
}

function load_save_infs(_save_name){
	ini_open(_save_name + ".sav");
	
	var _x;
	var _y;
	var _vida;
	var _nivel;
	var _forca;
	var _defesa;
	var _vitalidade;
	var _room;
	var _garoto;
	var _experiencia;
	
	var _data = {
		_x          : round( ini_read_real("Player", "x", 0)            ),
		_y          : round( ini_read_real("Player", "y", 0)            ),
		_vida       : round( ini_read_real("Player", "vida", 100)       ),
		_nivel      : round( ini_read_real("Player", "level", 1)        ),
		_forca      : round( ini_read_real("Player", "forca", 1)        ),
		_defesa     : round( ini_read_real("Player", "defesa", 1)       ),
		_vitalidade : round( ini_read_real("Player", "vitalidade", 1)   ),
		_room       : ini_read_real("Player", "room", rm_fase_1_amb_1   ),
		_garoto     : round(ini_read_real("Player", "garoto", 0)        ),
		_experiencia: round( ini_read_real("Player", "experiencia", 0)),
	}
	
	ini_close();
	
	return _data;
}

function ds_list_count(_id, _index){
	var _return = 0;
	for( var _i = 0; _i < ds_list_size(_id); _i++){
		if( _id[|_i] == _index ) _return++;
	}
	
	return _return;
}