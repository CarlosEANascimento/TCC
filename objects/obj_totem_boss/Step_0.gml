if( place_meeting(x, y, obj_player) and !interagindo and keyboard_check_released(ord("F")) ){
	interagindo = true;
	num = 0;
}

if( interagindo ) obj_player.hspd = 0;

if( draw_phrase ) num++;