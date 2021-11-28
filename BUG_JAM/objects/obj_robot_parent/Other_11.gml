/// @description Catch usb

//Usb chase logic
if(instance_exists(obj_usb)){

   var _usb = obj_usb;
   
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

}else{ Target=TargetMode.player; }


//Start targeting the player if it keeps staying close
if(collision_rectangle(bbox_left-8,bbox_top-12,bbox_right+8,bbox_bottom,obj_playerparent,0,0)){

   if(annoyance<6*room_speed){annoyance++;}else{annoyance=-1; Target=TargetMode.player;}
  

}