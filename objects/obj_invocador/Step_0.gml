if( keyboard_check(vk_control) ){
	if( keyboard_check_pressed(vk_numpad0) ) instance_create_depth(mouse_x, mouse_y, depth, obj_andarilho);
	if( keyboard_check_pressed(vk_numpad1) ) instance_create_depth(mouse_x, mouse_y, depth, obj_ceifador);
	if( keyboard_check_pressed(vk_numpad2) ) instance_create_depth(mouse_x, mouse_y, depth, obj_curandeiro_bubonico);
	if( keyboard_check_pressed(vk_numpad3) ) instance_create_depth(mouse_x, mouse_y, depth, obj_mestre_da_peste);
	if( keyboard_check_pressed(vk_numpad4) ) instance_create_depth(mouse_x, mouse_y, depth, obj_slime_g);
	if( keyboard_check_pressed(vk_numpad5) ) instance_create_depth(mouse_x, mouse_y, depth, obj_experiencia);
	if( keyboard_check_pressed(vk_numpad6) ) instance_create_depth(mouse_x, mouse_y, depth, obj_cura);
	if( keyboard_check_pressed(vk_numpad7) ) instance_create_depth(mouse_x, mouse_y, depth, obj_vida);
	if( keyboard_check_pressed(vk_numpad8) ) instance_create_depth(mouse_x, mouse_y, depth, obj_centopeia);
	if( keyboard_check_pressed(vk_numpad9) ) instance_create_depth(mouse_x, mouse_y, depth, obj_boss_peste_seres);
}
if( keyboard_check_pressed(ord("L")) ) load_game(global.save_name);
if( mouse_check_button_pressed(mb_right) ) particulas(mouse_x, mouse_y, "vaso_quebrando");
