//ataque = 0 -> ataque básico 1
//ataque = "hab1" -> habilidade 1

depth = obj_player.depth - 1;
if( !param )
{
	
switch ataque{
	case 0:
	sprite_index = spr_player_hit_box_atq_basico;
	image_xscale = obj_player.image_xscale;
	audio_play_sound(snd_balanco_espada_1, 1, 0);
	dano = 10;
	
	image_alpha = 0.4;
	image_blend = c_red;
	break;
	
	case 0.5:
	sprite_index = spr_player_hit_box_atq_ar;
	image_xscale = obj_player.image_xscale;
	audio_play_sound(snd_balanco_espada_1, 1, 0);
	dano = 10;
	
	image_alpha = 0.4;
	image_blend = c_red;
	break;
	
	case "hab1":
	sprite_index = spr_player_ataque_hab_1;
	image_alpha = 1;
	image_xscale = obj_player.image_xscale;
		
	dir = sign(obj_player.image_xscale);
	dano = 20;
		
	hspd = 15;
	break;
}

param = true;

}
else
{

switch ataque{
	case 0:
	x = obj_player.x;
	y = obj_player.y;
	break;
	
	case 0.5:
	x = obj_player.x;
	y = obj_player.y;
	break;
	
	case "hab1":
	move_and_collide(hspd * dir, vspd, obj_null);
	
	hspd += 0.05;
	
	image_alpha -= 0.025;
	image_xscale += 0.2 * dir;
	image_yscale += 0.25;
	
	if( image_alpha <= 0 ){
		instance_destroy();
	}
	break;
}

}