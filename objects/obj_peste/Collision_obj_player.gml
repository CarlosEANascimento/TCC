if (!colisao) {
    if( hit ){
		other.vida -= 5;
		hit = false;
		alarm[0] = 180;
	}

    if (obj_player.x < x) {
        hspd = irandom_range(3, 4);
        dir = -1;
    } else {
        hspd = irandom_range(-4, -3);
        dir = 1;
    }
    colisao = true;
}
