if( !hit and !instance_exists(obj_player_habilidade_2) ){
	other.vida -= dano - (dano * global.nvl_defesa/50);
	hit = true;
}