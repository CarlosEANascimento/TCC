#region BOTÕES
btn_esq = 0;
btn_dir = 0;
btn_pulo = 0;
btn_dash = 0;
btn_cura = 0;
btn_atq = 0;
#endregion

#region MOVIMENTAÇÃO
hspd = 0;
vspd = 0;
max_vel = 10;
grv = 0;
acel = 0.5;

direcao = 0;
#endregion

#region COMBATE
vida = 100;
vida_max = 100;
vida_extra = 0;
vida_temp = 0;

pcs_cura = 0;
pcs_cura_max = 5;

experiencia = 0;
exp_temp = 0;
nivel = 1;

hit = false;
temp_dano = 0;

dash = false;
colisao_dash = 0;

hit_box = 0;

hab2_buff = 1;
hab3_buff = 1;
#endregion

#region HABILIDADES E STATUS
btn_hab1 = 0;
btn_hab2 = 0;
btn_hab3 = 0;

hab3 = false;
habilidades = ds_list_create();

pontos_habilidade = 0;

global.colldown_hab1 = 180;
global.colldown_hab2 = 600;
global.colldown_hab3 = 1500;

global.nvl_forca = 0;
global.nvl_defesa = 0;
global.nvl_vida = 0;
#endregion

#region efeitos visuais
piscar_tela = 0;
r_luz_ambiente = 150;
g_luz_ambiente = 150;
b_luz_ambiente = 150;
rgb_padrao = 150;
#endregion

#region OUTROS
state = player_moving;

global.interagindo = false;
global.save_name = "";

global.trajetoria = ds_list_create();
global.garoto = false;

global.trilha_sonora = audio_play_sound(snd_trilha_1, 1, 1);
#endregion