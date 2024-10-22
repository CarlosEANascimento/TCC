if (!place_meeting(x, y + vspd, obj_bloco)) {
    vspd += 1;
} else {
    vspd = (irandom_range(0, 19) < 1) ? -5 : 0;
    hspd = (obj_player.x < x) ? irandom_range(1, 3) * -1 : irandom_range(1, 3);
}

move_and_collide((!place_meeting(x, y + 1, obj_bloco)) ? hspd : 0, vspd, obj_bloco);

if (vida <= 0) {
	drop_itens(0 + (ds_list_count(global.trajetoria, room) - 1), 2 + (ds_list_count(global.trajetoria, room) - 1), obj_experiencia);
	drop_itens(0 + (ds_list_count(global.trajetoria, room) - 1), 2 + (ds_list_count(global.trajetoria, room) - 1), obj_vida);
	
	particulas(0, 0, "morte");
    instance_destroy();
}

image_xscale = (1 + ((ds_list_count(global.trajetoria, room) - 1)/10)) * sign(image_xscale);
image_yscale = (1 + ((ds_list_count(global.trajetoria, room) - 1)/10)) * sign(image_yscale);