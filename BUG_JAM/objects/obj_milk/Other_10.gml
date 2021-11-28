/// @description Explode
// You can write your code in this editor

with(instance_create_depth(x+8,y+8,depth-2,obj_effect_method)){
		
		   image_xscale=128*(1/(4-global.upgrade[? "Spread"]));
		image_alpha = 0.8;
		   my_draw_method=function(){
			
			   draw_set_colour(c_yellow); draw_set_alpha(image_alpha);
			   draw_circle(x,y,image_xscale,0);
			   draw_set_colour(c_white); draw_set_alpha(1);
			   
		   }
		   
		   my_method=function(){
			   
			   image_alpha-=0.02;
			   image_xscale+=0.5;
			   if(image_alpha<=0){instance_destroy();}
			
		   }
		
}


for(var a=0; a<5; a++){
    with(instance_create_depth(x+8,y+8,depth+4,obj_effect_method)){
		
		 direction = (360/5)*a+10;
		 speed = 6;
		
		 
	     my_draw_method=function(){
		     draw_set_colour(c_yellow);draw_set_alpha(0.8);
			 draw_circle(x,y,2,0);
			 draw_set_alpha(1); draw_set_colour(c_white);
			 
			 
			 if(y>=room_height){instance_destroy();}
			 if(y<0){instance_destroy();}
			 if(x>=room_width){instance_destroy();}
			 if(x<0){instance_destroy();}
		 }
	}
}

with(instance_create_depth(x+8,y+8,depth+4,obj_effect_method)){
 
     sprite_index=spr_bigspark;
	 image_xscale=0.2;
	 image_yscale = image_xscale;
	 image_alpha=3;
	 
	 my_draw_method=function(){
	    draw_self();	 
	 }
	 
	 my_method=function(){
	    if(image_alpha>0){image_alpha-=0.2;}else{instance_destroy();}
		
		image_xscale=lerp(image_xscale,1/(4-global.upgrade[? "Spread"]),0.1);
	    image_yscale = image_xscale;
		
		with(collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_robot_parent,0,0)){
			 sparked = true;
			 sparktime = 14*room_speed;
		} 
	 }
	
}

instance_destroy();