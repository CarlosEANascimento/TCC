other.vspd = ( y > obj_player.x )? irandom_range(-10, -8) : irandom_range(8, 10) ;
other.hspd = ( x > obj_player.x )? irandom_range(-20, -15) : irandom_range(15, 20) ;
other.vida -= 1 - (1 * global.nvl_defesa/50);