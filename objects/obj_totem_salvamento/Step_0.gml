if( place_meeting(x, y, obj_player) and keyboard_check_pressed(ord("F")) and !salvo ){
	save_game();
	salvo = true;
	num = 0;
	alarm[0] = 1;
}