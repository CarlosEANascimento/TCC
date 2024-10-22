if( hit ){
	hspd *= -2;
	other.vida -= 2 - (2 * global.nvl_defesa/50);
	other.hspd = hspd * -5;
	other.vspd = vspd;
	hit = false;
}