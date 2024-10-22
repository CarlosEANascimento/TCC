var _dano;

try
{	
	 _dano = dano;
	if( hit ){
		other.vida -= _dano - (_dano * global.nvl_defesa/50);
		alarm[0] = 60;
		hit = false;
	}
}
catch(_dano)
{
	if( hit ){
		other.vida -= 5 - (5 * global.nvl_defesa/50);
		alarm[0] = 60;
		hit = false;
	}
}