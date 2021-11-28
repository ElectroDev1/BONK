/// @description Insert description here
// You can write your code in this editor

var _sin = sin(current_time*0.01)*4;

bktglitch_activate();

bktglitch_config(0.008667, 0.500000, 0.860000, 0.100000, 0.480000, 0.696007, 6.166667, 0.719142, 0.054253, 0.000000, 0.000000, 0.003333, 0.000000, 0.200000, 0.633333);

if(leader==id){
   draw_sprite_ext(spr_usb,0,x,bbox_bottom-40,1,1,_sin*sign(Dir),c_white,1);	
}

draw_sprite_ext(sprite_index,image_index,x,y,Xscale*sign(Dir),Yscale,image_angle,image_blend,image_alpha);


bktglitch_deactivate();

if(sparked){

   if(time % 10==0){
	
	  repeat(irandom_range(2,4)){
		
		     with(instance_create_depth(bbox_left+irandom(sprite_width),bbox_top+irandom(sprite_height),depth+2,obj_effect_method)){
			      vspeed =2;
				  image_alpha=0.4;
				  my_draw_method=function(){
					  draw_set_colour(c_yellow);draw_set_alpha(0.5);
					  draw_circle(x,y,2,0);
					  draw_set_colour(c_white);draw_set_alpha(1);
				  }
				  
				  my_method=function(){
					  if(image_alpha>0){ image_alpha -= 0.05; }else{ instance_destroy(); }  
				  }
			 }
		
	  }
	 
   }

}