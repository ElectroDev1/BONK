/// @description Ceiling effects
with(instance_create(x,bbox_top,obj_effect_method)){
     sprite_index=spr_ceilingstomp_effect;
     depth=-10;
     image_speed=0.5;
     
	 my_method=function(){
	   if(image_index>=image_number-1){ instance_destroy(); }	 
	 }
}

