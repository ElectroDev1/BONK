/// @description Insert description here
// You can write your code in this editor

if(alpha<1.5){

   alpha+=spd;

}else{

   instance_activate_object(obj_playerparent);
   
  
   
   with(obj_playerparent){
	    x = obj_spawn.x;
		y = obj_spawn.y-16;
		
		with(collision_circle(x,y-32,120,obj_robot_parent,1,0)){
		     health=0; event_user(0);	
		}
		
		
		if(other.revive){ HP = HP_max; }
	
			
			 with(obj_camera){
	              shakeY = 5; shakeTime=10;   
                }
			
		   with(instance_create_depth(x,y-32,depth-2,obj_effect_method)){
		
		   image_xscale=4;
		
		   my_draw_method=function(){
			
			   draw_set_colour(c_white); draw_set_alpha(image_alpha);
			   draw_circle(x,y,image_xscale,0);
			   draw_set_colour(c_white); draw_set_alpha(1);
			   
		   }
		   
		   my_method=function(){
			   
			   image_alpha-=0.02;
			   image_xscale+=0.5;
			   if(image_alpha<=0){instance_destroy();}
			
		   }
		
	  }
		
	  
   }
   
  
   with(instance_create_depth(x,y-32,depth-2,obj_effect_method)){
		
		   image_xscale=4;
		
		   my_draw_method=function(){
			
			   draw_set_colour(c_white); draw_set_alpha(image_alpha);
			   draw_circle(x,y,image_xscale,0);
			   draw_set_colour(c_white); draw_set_alpha(1);
			   
		   }
		   
		   my_method=function(){
			   
			   image_alpha-=0.02;
			   image_xscale+=0.5;
			   if(image_alpha<=0){instance_destroy();}
			
		   }
		
	  }
   
	  
	  instance_destroy();

}