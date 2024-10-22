c_box_top     = collision_rectangle(bbox_left, bbox_top - 1, bbox_right, bbox_top, obj_bloco, 0, 1);
c_box_right   = collision_rectangle(bbox_right, bbox_top, bbox_right + 1, bbox_bottom, obj_bloco, 0, 1);
c_box_botttom = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom + 1, obj_bloco, 0, 1);
c_box_left    = collision_rectangle(bbox_left - 1, bbox_top, bbox_left, bbox_bottom, obj_bloco, 0, 1);

if(   c_box_top   ) vspd *= -1.001;
if( c_box_botttom ) vspd *= -1.001;
if(   c_box_left  ) hspd *= -1.001;
if(  c_box_right  ) hspd *= -1.001;

move_and_collide(hspd, vspd, obj_bloco);

var _angle = point_direction(x, y, x + (hspd * 10), y - (vspd * 10));

image_angle = _angle;

if( _angle > 0 and _angle < 90 or _angle > 180 and _angle < 270 ){
	image_xscale = -1;
	image_yscale = -1;
}else{
	image_xscale = 1;
	image_yscale = 1;
}