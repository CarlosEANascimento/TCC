display_set_gui_size(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));

draw_set_color(c_black);
draw_set_alpha(alpha);
draw_rectangle(0, 0, window_get_width(), window_get_height(), 0);
draw_set_color(-1);
draw_set_alpha(1);