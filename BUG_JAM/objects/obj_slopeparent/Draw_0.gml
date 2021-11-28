


if(!instance_exists(obj_debug_room_controller)){

if(global.debug){
   draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,
   image_angle,Color,1);
}

}
else{ draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,
   image_angle,Color,1); }

