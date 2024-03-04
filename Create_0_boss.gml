#region MOVIMENTAÇÃO
vspd = 0;
hspd = 0;
vel = 2;
#endregion

#region FASES E COMBATE
etapa = 0;
estado = 1;
fase = 1;
habilidade = 0;
ataque = 0;
hit = true;
vida_fase1 = 500;
vida_fase2 = 450;
vida_fase3 = 400;

vida = vida_fase1;
_vida = vida;
#endregion

#region SPRITE GROUPS
sprites_etapa1 ={
	idle: spr_boss_rato_idle,
	mov: spr_boss_rato_walk,
	grito: spr_boss_rato_scream,
	bola_veneno: spr_boss_rato_guspe,
	onda_choque: spr_boss_rato_onda_choque,
	invoca: spr_boss_rato_invocando,
};

sprites_etapa2 = {
	idle: spr_boss_rato_idle_1,
	mov: spr_boss_rato_walk_1,
	grito: spr_boss_rato_scream,
	bola_veneno: spr_boss_rato_guspe_1,
	onda_choque: spr_boss_rato_onda_choque_1,
	invoca: spr_boss_rato_invocando_1,
};

sprites_etapa3 = {
	idle: spr_boss_rato_idle_2,
	mov: spr_boss_rato_walk_2,
	grito: spr_boss_rato_scream_1,
	bola_veneno: spr_boss_rato_guspe_2,
	onda_choque: spr_boss_rato_onda_choque_2,
	invoca: spr_boss_rato_invocando_2,
};

sprites = sprites_etapa1;
#endregion

emitter = 0;
num = 0;