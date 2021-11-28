/// @description Insert description here
// You can write your code in this editor

var _s = sin(current_time*0.01)*random(1.25);

image_xscale=1+abs(_s*0.75);
image_yscale=1-abs(_s*0.75);


if(alpha>=2.5){

   instance_destroy();

}

if(alpha>=0.5){
	alpha+=0.025;
}else{ alpha+=0.005; }

image_angle+=0.5;

if(irandom(20)>15){
	
	
      with(instance_create_depth(x,y-16,depth-1,obj_effect_method)){
		
		   image_xscale=irandom_range(1,3);
		   direction = irandom(360);
		   speed = 1 + irandom(2);
		   image_alpha = irandom_range(2,4);
		   x+=lengthdir_x(irandom(8),direction);
		   y+=lengthdir_y(irandom(8),direction);
		
		   my_draw_method=function(){
			
			   draw_set_colour(choose(c_white,c_black)); draw_set_alpha(image_alpha);
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