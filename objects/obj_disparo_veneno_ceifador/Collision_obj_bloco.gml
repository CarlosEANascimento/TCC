if( etapa == 0 ) particulas(x, y, "veneno_explode");
etapa = 1;
if (audio_emitter_exists(emitter)) {
  audio_emitter_free(emitter);
}
speed = 0;