global.mascara_sala = make_color_rgb(200, 200, 0);
global.interagindo = false;
//obj_player.depth = layer_get_depth("Fundo3") + 1;
layer_depth("Fundo3",obj_player.depth - 10);
check_and_create_obj_layer(obj_render_luz, 0, 0, "Instances");
window_set_fullscreen(1);