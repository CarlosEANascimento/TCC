#region variaveis
var _larg = display_get_gui_width();
var _altu = display_get_gui_height();

var _centro_x = _larg/2;
var _centro_y = _altu/2;

var _espaco = 16;

var _caixa = sprite_duplicate(spr_caixa_dialogo);
sprite_set_offset(_caixa, sprite_get_width(_caixa)/2, 0);

falas_fonte(npc, conversa);
#endregion

#region caixa
draw_sprite_stretched(_caixa, 0, _centro_x - tam_caixa/2, _espaco * 4, tam_caixa, _altu * 0.2);

if( tam_caixa <= (_larg - (_espaco * 16)) ){
	tam_caixa += (_larg - (_espaco * 16))/16;
}
#endregion

#region texto
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_monogram_extended_24);

if( tam_caixa >= (_larg - (_espaco * 16)) ){
	if( !txt_completo ){
		texto_atual = string_insert( string_char_at(fala[texto], letra), texto_atual, letra);
		
		if( letra <= string_length(fala[texto]) ){
			letra++;
		}
	}else{
		letra = string_length(fala[texto]);
		texto_atual = fala[texto];
	}
	
	draw_text_ext((_centro_x - tam_caixa/2) + _espaco, _espaco * 5, texto_atual , 24, tam_caixa - (_espaco * 2));
	
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	draw_set_font(fnt_beholden18);
	
	draw_text(_centro_x + tam_caixa/2, _espaco * 4 + _altu * 0.2, "F ->")
}
#endregion