var _forca;

try{
	_forca = forca;
	
	if( place_meeting(x, y, obj_player) ){
		obj_player.speed = ( obj_player.x < x )? -1 * forca : forca ;
	}else{
		obj_player.speed = 0;
	}
}catch(_forca){
	if( place_meeting(x, y, obj_player) ){
		obj_player.speed = ( obj_player.x < x )? -1 * 5 : 5 ;
	}else{
		obj_player.speed = 0;
	}
}

particulas(x, y, "bossPeste - grito");

if( obj_boss_peste.estado != 2 or !instance_exists(obj_boss_peste) ) instance_destroy();