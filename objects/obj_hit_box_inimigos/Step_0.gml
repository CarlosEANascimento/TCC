sprite_index = sprite;
image_xscale = dono.image_xscale;
x = dono.x;
y = dono.y;

if( image_index >= sprite_get_number(sprite) - 1  ){
	instance_destroy();
}

depth = obj_player.depth - 1;
image_blend = c_red;