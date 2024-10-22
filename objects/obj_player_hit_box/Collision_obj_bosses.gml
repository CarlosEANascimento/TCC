if( ds_list_find_index(inimigos_atingidos, other) == -1 ){
	ds_list_add(inimigos_atingidos, other);
	var _dano = dano + (dano * global.nvl_forca/50);
	
	other.vida -= _dano * obj_player.hab2_buff * obj_player.hab3_buff;
	obj_player.hab2_buff = 1;
}