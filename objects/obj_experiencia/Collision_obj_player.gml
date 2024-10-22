if( (other.experiencia + 1) >= other.nivel * 5 ){
	other.nivel++;
	other.experiencia = 0;
	instance_create_depth(0, 0, obj_player.depth - 1, obj_ponto_habilidade);
}else{
	other.experiencia++;
}

collect_itens_sound();
particulas(x, y, "coletando");
instance_destroy();