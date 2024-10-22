function luz(_x, _y, _cor, _intensidade, _escala_x, _escala_y, _id = 0){
	var _luz = instance_create_depth(_x, _y, 0, obj_fonte_luz);
	
	_luz.image_blend = _cor;
	_luz.image_xscale = _escala_x;
	_luz.image_yscale = _escala_y;
	_luz.image_alpha = _intensidade;
	
	if( _id ) return _luz;
}