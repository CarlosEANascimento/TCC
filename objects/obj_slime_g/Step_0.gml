image_xscale += sin(num * 0.1) * 0.005;
image_yscale -= sin(num * 0.1) * 0.005;

if (!place_meeting(x, y + vspd, obj_bloco)) {
    vspd += 1;
} else {
    vspd = 0;
}

if (!place_meeting(x, y, obj_poca_slime) and !instance_exists(poca)) {
    poca = instance_create_depth(x, y, depth + 1, obj_poca_slime);
}

move_and_collide(hspd, vspd, obj_bloco);

if (vida <= 0) {
    var _slime1 = instance_create_depth(x - sprite_get_width(spr_slime_m) / 2, y, depth - 1, obj_slime_m);
    _slime1.vspd = irandom_range(-5, -8);
    _slime1.hspd = irandom_range(-10, -3);

    var _slime2 = instance_create_depth(x - sprite_get_width(spr_slime_m) / 2, y, depth - 1, obj_slime_m);
    _slime2.vspd = irandom_range(-5, -8);
    _slime2.hspd = irandom_range(3, 10);

	drop_itens(5 + (ds_list_count(global.trajetoria, room) - 1), 10 + (ds_list_count(global.trajetoria, room) - 1), obj_experiencia);
	drop_itens(5 + (ds_list_count(global.trajetoria, room) - 1), 10 + (ds_list_count(global.trajetoria, room) - 1), obj_vida);
	drop_itens(1 + (ds_list_count(global.trajetoria, room) - 1), 2 + (ds_list_count(global.trajetoria, room) - 1), obj_cura);

	particulas(0, 0, "morte");
    instance_destroy();
}

num++;

image_xscale = (1 + ((ds_list_count(global.trajetoria, room) - 1)/10)) * sign(image_xscale);
image_yscale = (1 + ((ds_list_count(global.trajetoria, room) - 1)/10)) * sign(image_yscale);