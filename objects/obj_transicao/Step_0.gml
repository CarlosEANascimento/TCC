if( done ) alpha -= 0.025 else alpha += 0.025;

//audio_master_gain( 1 - alpha);
//audio_sound_gain(global.trilha_sonora, alpha, 0);

if( alpha >= 1 and action ){
	room_goto(destiny);
	obj_player.x = destiny_x;
	obj_player.y = destiny_y;
	
	switch pos_action{
		case 1:
		obj_player.vida = obj_player.vida_max * 0.75;
		
		obj_player.alarm[0] = 0;
		obj_player.alarm[1] = 0;
		obj_player.alarm[8] = 0;
		obj_player.alarm[9] = 0;
		obj_player.alarm[10] = 0;
		
		instance_destroy(obj_reviver);
		break;
	}
}

if(done and alpha <= 0) instance_destroy();