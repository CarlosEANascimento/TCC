if( ds_list_find_index(inimigos_atingidos, other) == -1 ){
	ds_list_add(inimigos_atingidos, other);
	other.vida -= dano + (dano * global.nvl_forca/50);
}