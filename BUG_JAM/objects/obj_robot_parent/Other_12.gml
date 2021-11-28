/// @description Catch gate

//Usb chase logic
if(instance_exists(obj_gate)){

   var _usb = obj_gate;
   
   if(x>_usb.x){Dir=-1;}
   if(x<_usb.x){Dir=1;}
   
   if(collision_rectangle(bbox_right-4,bbox_top,bbox_right+4,bbox_bottom-3,obj_solid,0,0))&&(Dir==1){
	  
	  
	   
	  if(vspeed==0)
	  &&(!collision_rectangle(bbox_right-4,bbox_bottom-sprite_height*3,bbox_right+4,bbox_bottom-sprite_height*2,obj_solid,0,0))
	  { vspeed=-jumpspeed; }   
   }
   
   if(collision_rectangle(bbox_left-4,bbox_top,bbox_left+4,bbox_bottom-3,obj_solid,0,0))&&(Dir==-1){
	  if(vspeed==0)
	   &&(!collision_rectangle(bbox_left-4,bbox_bottom-sprite_height*3,bbox_left+4,bbox_bottom-sprite_height*2,obj_solid,0,0))
	  { vspeed=-jumpspeed; }   
   }
   
   if(collision_rectangle(x-16,bbox_top,x+16,bbox_bottom,obj_gate,0,0)){
	  hspeed=0;
	  
	  alarm[2] = 40;
	  sprite_index = sprite_insert;
	  image_speed=0; image_index = 0; stop=0;
	  Target=TargetMode.insert;
   }

}
