global.interagindo = false;

repeat(pts_habilidade){
	instance_create_depth(0, 0, obj_player.depth - 1, obj_ponto_habilidade);
}