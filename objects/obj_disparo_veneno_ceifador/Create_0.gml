move_towards_point(
	lerp(obj_player.bbox_left, obj_player.bbox_right, 0.5),
	lerp(obj_player.bbox_bottom, obj_player.bbox_top, 0.5),
	10
);

image_angle = point_direction(x, y, lerp(obj_player.bbox_left, obj_player.bbox_right, 0.5), lerp(obj_player.bbox_bottom, obj_player.bbox_top, 0.5));

audio = snd_feitico_voando;
emitter = 0;

som = 0;
etapa = 0;

particulas(x, y, "veneno_surge");

ilu = instance_create_depth(x, y, 0, obj_fonte_luz);

ilu.image_blend =  make_color_rgb(10, 255, 10);
ilu.image_xscale = 1;
ilu.image_yscale = 1;
ilu.image_alpha = 0.7;

//ilu = luz(x, y, make_color_rgb(10, 255, 10), 0.7, 1, 1, 1);