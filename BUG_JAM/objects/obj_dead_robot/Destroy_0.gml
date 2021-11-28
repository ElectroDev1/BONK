/// @description Insert description here
// You can write your code in this editor


repeat(irandom_range(60,80)){
	
	
      with(instance_create_depth(x,y,depth-2,obj_effect_method)){
		
		   image_xscale=irandom_range(1,3);
		   direction = irandom(360);
		   speed = 2 + irandom(3);
		   image_alpha = irandom_range(2,4);
		   x+=lengthdir_x(irandom(18),direction);
		   y+=lengthdir_y(irandom(18),direction);
		
		   my_draw_method=function(){
			
			   draw_set_colour(c_black); draw_set_alpha(image_alpha);
			   draw_circle(x,y,image_xscale,0);
			   draw_set_colour(c_white); draw_set_alpha(1);
			   
		   }
		   
		   my_method=function(){
			
			   if(speed>0.5){speed-=0.5;}
			   
			   image_alpha-=0.05;
			   
			   if(image_alpha<=0){instance_destroy();}
			
		   }
		
	  }
	
}

with(instance_create_depth(x,y,depth-2,obj_effect_method)){
		
		   image_xscale=4;
		
		   my_draw_method=function(){
			
			   draw_set_colour(c_black); draw_set_alpha(image_alpha);
			   draw_circle(x,y,image_xscale,0);
			   draw_set_colour(c_white); draw_set_alpha(1);
			   
		   }
		   
		   my_method=function(){
			   
			   image_alpha-=0.02;
			   image_xscale+=0.5;
			   if(image_alpha<=0){instance_destroy();}
			
		   }
		
	  }