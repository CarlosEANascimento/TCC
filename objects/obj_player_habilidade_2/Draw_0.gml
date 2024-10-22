var _sin = sin(sin_num * 0.1);

gpu_set_blendmode(bm_add);
draw_set_alpha(0.5 * _sin);
draw_circle_color(x, y, (sprite_get_height(sprite_index)/2) + 24, make_color_rgb(255,250,180), c_black, 0);
draw_set_alpha(1);
gpu_set_blendmode(bm_normal);

draw_self();