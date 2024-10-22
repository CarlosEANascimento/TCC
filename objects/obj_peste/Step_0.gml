if (hspd == 0) {
    move_towards_point(obj_player.x, obj_player.y - sprite_get_height(obj_player.sprite_index) / 2, vel);
    colisao = false;
} else {
    move_and_collide(hspd, 0, obj_null);
}

image_xscale = (obj_player.x > x) ? 1 : -1;

if (hspd != 0) {
    hspd += (0.1 * dir);
}

if (vida <= 0) {
    instance_destroy();
}

image_xscale = (1 + ((ds_list_count(global.trajetoria, room) - 1)/10)) * sign(image_xscale);
image_yscale = (1 + ((ds_list_count(global.trajetoria, room) - 1)/10)) * sign(image_yscale);