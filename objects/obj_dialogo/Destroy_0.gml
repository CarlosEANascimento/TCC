switch pos_acao{
	case 1: //garoto seguir
	if( !obj_garoto.seguindo ) obj_garoto.seguindo = true;
	global.garoto = true;
	break;
}

global.interagindo = false;