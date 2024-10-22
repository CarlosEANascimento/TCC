switch etapa{
	case 0:
	other.vida -= 40;
	if (audio_emitter_exists(emitter)) {
		audio_emitter_free(emitter);
	}
	particulas(x, y, "veneno_explode");
	instance_destroy();
	break;
	
	case 1:
	if( alarm[0] <= 0 ){
		other.vida -= 5;
		alarm[0] = 120;
	}
	break;
}