if( seguindo ){

global.garoto = true;
switch estado{
	#region idle/seguir
	case 0: //idle e seguir
	image_alpha = 1;
	
	if( distance_to_object(obj_player) > 1 ){
		image_xscale = ( x < obj_player.x )? 1 : -1 ;
	}
	
	if( distance_to_object(obj_player) > 128 ){
		if( sign(obj_player.image_xscale) = 1 and sign(obj_player.hspd) = 1 and x < obj_player.x ){
			hspd = lerp(hspd, obj_player.hspd, 0.5);
		}else if( sign(obj_player.image_xscale) = -1 and sign(obj_player.hspd) = -1 and x > obj_player.x ){
			hspd = lerp(hspd, obj_player.hspd, 0.5);
		}
	}else{
		hspd = 0;
	}
	move_and_collide(hspd, 0, obj_bloco);
	
	if( distance_to_object(obj_player) > 512 ){
		x = obj_player.x;
		y = obj_player.y;
	}
	
	if( hspd != 0 ){
		sprite_index = spr_garoto_mov;
	}else{
		sprite_index = spr_garoto_idle;
	}
	
	if( distance_to_object(obj_inimigos) < 320 and alarm[0] <= 0 ){
		estado = 1;
		image_index = 0;
	}else if(distance_to_object(obj_inimigos) < 320){
		estado = 2;
		image_index = 0;
	}
	break;
	#endregion
	
	#region atirar
	case 1: //atirando
	var _inimigo;
	
	try{
		_inimigo = instance_nearest(x, lerp(bbox_bottom, bbox_top, 0.5), obj_inimigos)
		
		sprite_index = spr_garoto_atira;
		image_xscale = (_inimigo.x > x)? 1 : -1 ;
	
		if( image_index >= sprite_get_number(sprite_index) - 1 ){
			var _disparo = instance_create_depth(bbox_right, lerp(bbox_bottom, bbox_top, 0.5), depth - 1, obj_pedra_garoto);
			_disparo.dir = sign(image_xscale);
			_disparo.alvo = _inimigo;
		
			estado = 0;
			alarm[0] = 120;
		}
	}catch(_inimigo) {
		sprite_index = spr_garoto_atira;
		image_xscale = image_xscale;
	
		if( image_index >= sprite_get_number(sprite_index) - 1 ){
			var _disparo = instance_create_depth(bbox_right, lerp(bbox_bottom, bbox_top, 0.5), depth - 1, obj_pedra_garoto);
			_disparo.dir = sign(image_xscale);
			_disparo.alvo = _inimigo;
		
			estado = 0;
			alarm[0] = 120;
		}
	}
	break;
	#endregion
	
	#region esconder
	case 2: //condeu
	sprite_index = spr_garoto_esconde;
	
	if( image_alpha > 0.4 ){
		image_alpha -= 0.05;
	}
	
	if( distance_to_object(obj_inimigos) > 320 or alarm[0] <= 0 ){
		estado = 0;
		image_index = 0;
	}
	break;
	#endregion
}

}else{
var _dialogo;

if( !interagindo ){
	image_xscale += sin(num * 0.1) * 0.005;
	image_yscale -= sin(num * 0.1) * 0.005;
}

if( distance_to_object(obj_player) < 128 and keyboard_check_pressed(ord("F")) and !instance_exists(obj_dialogo) ){
	interagindo = true;
	global.interagindo = true;
	
	_dialogo = instance_create_depth(0, 0, depth, obj_dialogo);
	_dialogo.npc = "garoto";
	_dialogo.conversa = 0;
	_dialogo.pos_acao = 1;
}

if( instance_exists(obj_dialogo)){
	if( obj_dialogo.texto == 0 ){
		sprite_index = spr_garoto_esconde;
	}else{
		sprite_index = spr_garoto_idle;
	}
	image_xscale = ( x < obj_player.x )? 1 : -1 ;
}

}

depth = obj_player.depth + 1;
gravidade();

num++;