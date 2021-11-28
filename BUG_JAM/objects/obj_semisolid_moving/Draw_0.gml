
if(!instance_exists(obj_debug_room_controller)){

if(global.debug){
draw_self();

draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,true);
}

}
else{ 
draw_self();

draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,true);
}

//Draw the platform

if(scr_inside_view(8)){

   if(sprite_exists(sprite_left)){
   draw_sprite(sprite_left,image[0],x,y);
   
   for(var a=32; a<sprite_width-32; 
       a+=32){
     
        draw_sprite(sprite_center,image[1],x+a,y);
          
   }
   
   
   draw_sprite(sprite_right,image[2],
   x+sprite_width-32
   ,y);
   }
}

