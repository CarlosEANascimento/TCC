var _centro_x = display_get_gui_width()/2;
var _centro_y = display_get_gui_height()/2;

if( alpha_1 < 1 ) alpha_1 += 0.01;

draw_set_alpha(alpha_1);

draw_set_valign(fa_bottom);
draw_set_halign(fa_center);
draw_set_font(fnt_beholden64);
draw_text(_centro_x, _centro_y, "Você Morreu");

if( alpha_1 >= 1 and alpha_2 < 1 ) alpha_2 += 0.01;

draw_set_alpha(alpha_2);

draw_set_valign(fa_top);
draw_set_font(fnt_beholden18);
draw_text(_centro_x, _centro_y, "Pressione - R - para retornar ao último checkpoint");

if( alpha_2 >= 1 ){
	if( keyboard_check_pressed(ord("R")) ){
		var _trans = instance_create_depth(0, 0, depth - 1, obj_transicao);
		
		_trans.destiny = load_save_infs(global.save_name)._room;
		_trans.destiny_x = load_save_infs(global.save_name)._x;
		_trans.destiny_y = load_save_infs(global.save_name)._y;
		_trans.pos_action = 1;
		
		with(obj_disparo_veneno_ceifador){
			if (audio_emitter_exists(emitter)) {
			  audio_emitter_free(emitter);
			}
		}
		
		audio_sound_gain(global.trilha_sonora, 0, 60);
		global.trilha_sonora = audio_play_sound(snd_trilha_1, 1, 1);
	}
}

reset_draw_settings();
num++;