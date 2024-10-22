switch etapa{
	case 0:
	if(image_index >= sprite_get_number(sprite_index) - 1) etapa++;
	break;
	
	case 1:
	move_towards_point(destiny_x, destiny_y, 30);
	etapa++;
	break;
	
	case 2:
	break;
}

switch origem{
	case 1: //DIREITA
	image_angle = 90;
	break;

	case 2: //ESQUERDA
	image_angle = 270;
	break;

	case 3: //TETO
	image_angle = 180;
	break;
}