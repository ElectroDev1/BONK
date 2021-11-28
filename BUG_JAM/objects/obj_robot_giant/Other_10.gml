/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

with(obj_robot_parent){
  
       with(instance_create_depth(x,y,depth-1,obj_dead_robot)){
	    sprite_index = other.sprite_dead;   
	
   }
   
   
   
   obj_mvm_controller.mvm_wave_robotlist[type]--;
   obj_mvm_controller.robots--;
   
   instance_destroy();

	
}

with(obj_mvm_controller){ 
	
	scr_play_music("final_wave_end.ogg",1,0,0.5); mvm_state = MVMSTATE.over; alarm[3]=25*room_speed; 
	
	}