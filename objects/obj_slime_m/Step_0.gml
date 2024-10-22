if (!place_meeting(x, y + vspd, obj_bloco)) {
    vspd += 1;
} else {
    vspd = (irandom_range(0, 9) < 1) ? -10 : 0;
    hspd = (obj_player.x < x) ? irandom_range(3, 6) * -1 : irandom_range(3, 6);
}

move_and_collide((!place_meeting(x, y + 1, obj_bloco)) ? hspd : 0, vspd, obj_bloco);

if (vida <= 0) {
    var _slime1 = instance_create_depth(x - sprite_get_width(spr_slime_p) / 2, y, depth - 1, obj_slime_p);
    _slime1.vspd = irandom_range(-5, -8);
    _slime1.hspd = irandom_range(-10, -3);

    var _slime2 = instance_create_depth(x - sprite_get_width(spr_slime_p) / 2, y, depth - 1, obj_slime_p);
    _slime2.vspd = irandom_range(-5, -8);
    _slime2.hspd = irandom_range(3, 10);

	drop_itens(2 + (ds_list_count(global.trajetoria, room) - 1), 7 + (ds_list_count(global.trajetoria, room) - 1), obj_experiencia);
	drop_itens(2 + (ds_list_count(global.trajetoria, room) - 1), 7 + (ds_list_count(global.trajetoria, room) - 1), obj_vida);
	drop_itens(0 + (ds_list_count(global.trajetoria, room) - 1), 1 + (ds_list_count(global.trajetoria, room) - 1), obj_cura);


	particulas(0, 0, "morte");
    instance_destroy();
}

image_xscale = (1 + ((ds_list_count(global.trajetoria, room) - 1)/10)) * sign(image_xscale);
image_yscale = (1 + ((ds_list_count(global.trajetoria, room) - 1)/10)) * sign(image_yscale);