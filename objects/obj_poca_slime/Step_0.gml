image_alpha = alpha;

if (irandom_range(0, 4) < 1) {
    //particula(x, y, "POCA");
}

if (!place_meeting(x, y + vspd, obj_bloco)) {
    vspd += 1;
} else {
    vspd = 0;
}

if (!place_meeting(x, y - 1, obj_slime_g)) {
    alpha -= 0.01;
}

if (alpha <= 0) {
    instance_destroy();
}

move_and_collide(hspd, vspd, obj_bloco);
