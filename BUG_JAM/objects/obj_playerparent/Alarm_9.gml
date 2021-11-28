/// @description Insert description here
// You can write your code in this editor
invincible=0;



with(instance_create_depth(x,y-32,depth-2,obj_effect_method)){
		
		   image_xscale=4;
		
		   my_draw_method=function(){
			
			   draw_set_colour(c_red); draw_set_alpha(image_alpha);
			   draw_circle(x,y,image_xscale,0);
			   draw_set_colour(c_white); draw_set_alpha(1);
			   
		   }
		   
		   my_method=function(){
			   
			   image_alpha-=0.04;
			   image_xscale+=1;
			   if(image_alpha<=0){instance_destroy();}
			
		   }
		
	  }