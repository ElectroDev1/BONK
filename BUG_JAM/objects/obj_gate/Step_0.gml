/// @description Insert description here
// You can write your code in this editor
time++;
if(obj_mvm_controller.mvm_state == MVMSTATE.lose){

   if(time%1==0){
	 repeat(irandom_range(15,20)){
	  with(instance_create_depth(x,y-8,depth+1,obj_effect_method)){
		   my_draw_method=function(){
			  draw_set_colour(c_black);
			  draw_circle(x,y,6,0);
			  draw_set_colour(c_white);
		   }
		   direction = 90+irandom_range(-10,10);
		   speed = irandom_range(10,14);
		   my_method=function(){
			    var _s = sin(current_time*0.001);
				direction += _s*2;
				if(y<obj_camera._fy-10){instance_destroy();}
		   }
		   
		   
	  }
	 }
   }
	
}