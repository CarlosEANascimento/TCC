vel = irandom_range(2, 3);
hspd = 0;
vspd = 0;
vida = 10;

hit = 1;

audio = audio_play_sound(snd_som_de_rato, 0, 1);

audio_sound_pitch(audio, irandom(10)/10)