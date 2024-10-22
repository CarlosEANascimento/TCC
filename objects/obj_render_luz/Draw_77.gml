surface_set_target(surf_luz);
	gpu_set_blendmode_ext(bm_dest_color, bm_zero);
	draw_surface(application_surface, 0, 0);
	gpu_set_blendmode(bm_normal);
surface_reset_target();

draw_surface_stretched(surf_luz, 0, window_get_height()/2 - window_get_width()/4, window_get_width(), window_get_width()/2);