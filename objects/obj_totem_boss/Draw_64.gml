var _centro_x = display_get_gui_width()/2;
var _centro_y = display_get_gui_height()/2;
var _sin = sin(num * 0.01);

if( draw_phrase and interagindo ){
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fnt_help_me_128);
	
	draw_text_transformed_color(_centro_x, _centro_y, boss_text, 0.18, 0.18, 0, c_white, c_white, boss_color, boss_color, _sin);
	//draw_text_color(_centro_x, _centro_y, boss_text, c_white, c_white, boss_color, boss_color, _sin);
}

if( _sin <= 0 and draw_phrase and interagindo ){
	draw_phrase = false;
	audio_sound_gain(global.trilha_sonora, 0, 60);
	global.trilha_sonora = audio_play_sound(snd_boss_fight_trilha, 1, 1);
	instance_create_depth(x, 0, obj_player.depth + 1, obj_boss_peste);
}