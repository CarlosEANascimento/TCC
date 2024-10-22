if( vspd == 0 and (other.pcs_cura + 1) <= other.pcs_cura_max ){
	other.pcs_cura++;
	collect_itens_sound();
	particulas(x, y, "coletando");
	instance_destroy();
}