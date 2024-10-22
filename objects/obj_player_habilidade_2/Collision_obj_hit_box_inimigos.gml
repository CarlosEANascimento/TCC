obj_player.hab2_buff = 2;
instance_destroy(other);
instance_destroy();
particulas(0, 0, "big_hit", bbox_left, bbox_right, bbox_top, bbox_bottom);