c_box_top     = 0;
c_box_right   = 0;
c_box_botttom = 0;
c_box_left    = 0;

hspd = choose(-1, 1);
vspd = choose(-1, 1);

anterior = instance_create_depth(x - (hspd * 16), y - (vspd * 16), depth, obj_centopeia_2);
anterior.proximo = id;
anterior.hspd = hspd;
anterior.vspd = vspd;
anterior.image_angle = point_direction(x, y, x + (hspd * 10), y - (vspd * 10));