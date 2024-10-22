if( !hit ){
	repeat( irandom_range(3,5) ){
		instance_create_depth(x, bbox_top, obj_player.depth - 1, obj_vida);
	}

	repeat( irandom_range(0,1) ){
		instance_create_depth(x, bbox_top, obj_player.depth - 1, obj_cura);
	}

	emitter = audio_emitter_create();
	audio_play_sound_on(emitter, choose(snd_vaso_quebrando_1, snd_vaso_quebrando_2, snd_vaso_quebrando_3), 0, 0);

	particulas(x, y, "vaso_quebrando");
	hit = true;
	image_alpha = 0;
	alarm[0] = 90;
}