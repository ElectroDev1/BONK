/// @description Die
// You can write your code in this editor
   with(instance_create_depth(x,y,depth-1,obj_dead_robot)){
	    sprite_index = other.sprite_dead;   
	
   }
   
   obj_mvm_controller.mvm_wave_robotlist[type]--;
   obj_mvm_controller.robots--;
 
with(instance_create_depth(x,y-10,depth+2,obj_coin)){
     vspeed=-1;
	 value = other.money;
}

if(leader==id){

   instance_create_depth(x,y,depth,obj_usb);

}