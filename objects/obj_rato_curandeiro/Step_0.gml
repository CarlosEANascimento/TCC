if (!place_meeting(x, y + vspd, obj_bloco)) {
    vspd += 1;
} else {
    vspd = 0;
}

if (place_meeting(x, y + 1, obj_bloco)) {
    vspd -= irandom_range(5, 7.5);
    hspd = (obj_player.x > x) ? vel : vel * -1;
}

if (vida <= 0) {
    instance_destroy();
}

move_and_collide(hspd, vspd, obj_bloco);

image_xscale = sign(image_xscale);

image_xscale = (1 + ((ds_list_count(global.trajetoria, room) - 1)/10)) * sign(image_xscale);
image_yscale = (1 + ((ds_list_count(global.trajetoria, room) - 1)/10)) * sign(image_yscale);