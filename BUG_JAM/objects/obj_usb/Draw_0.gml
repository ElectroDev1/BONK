/// @description Insert description here
// You can write your code in this editor
draw_self();


if(!surface_exists(surf)){
   surf = surface_create(36,36);	
}else{

   var _W = surface_get_width(surf);
   var _H = surface_get_height(surf);

   surface_set_target(surf);

   draw_clear_alpha(c_white,0);

   draw_pie(_W/2,_H/2,lifetime,og_lifetime,RED,16,1);

 
   gpu_set_blendmode(bm_subtract);

   draw_circle(_W/2-1,_H/2,6,0);
   
   gpu_set_blendmode(bm_normal);

   
   surface_reset_target();
  
    
   draw_surface(surf,x-_W/2,bbox_top-_H/2-24);
   
}