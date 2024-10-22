if( colisao ){
	other.vida -= 10 - (10 * global.nvl_defesa/50);
	hspd *= -2;
	colisao = false;
	alarm[0] = 60;
}