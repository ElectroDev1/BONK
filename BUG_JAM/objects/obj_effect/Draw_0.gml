/// @description Draw itself
if(instance_number(obj_effect)>900)&&(Xscale<0.5)&&(Yscale<0.5){instance_destroy();}
//Check if outside the view
if(scr_inside_view(sprite_width+Viewoffset)==true)
&&(sprite_exists(sprite_index)){
   draw_set_blend_mode(mode);
   draw_sprite_ext(sprite_index,image_index,round(x),round(y),Xscale,Yscale,image_angle,Color,image_alpha);
   draw_set_blend_mode(bm_normal);
}


