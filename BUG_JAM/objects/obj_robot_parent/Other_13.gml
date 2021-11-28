/// @description Get to player


//Player chase logic
if(instance_exists(obj_playerparent)){

   var _player = obj_playerparent;
   
   if(x>_player.x){Dir=scr_approach(Dir,-1,0.05);}
   if(x<_player.x){Dir=scr_approach(Dir,1,0.05);}
   
   if(collision_rectangle(bbox_right-4,bbox_top,bbox_right+4,bbox_bottom-16,obj_solid,0,0))&&(Dir==1){
	  
	  
	   
	  if(vspeed==0)
	  &&(!collision_rectangle(bbox_right-4,bbox_bottom-sprite_height*3,bbox_right+4,bbox_bottom-sprite_height*2,obj_solid,0,0))
	  { vspeed=-jumpspeed; }   
   }
   
   if(collision_rectangle(bbox_left-4,bbox_top,bbox_left+4,bbox_bottom-16,obj_solid,0,0))&&(Dir==-1){
	  if(vspeed==0)
	   &&(!collision_rectangle(bbox_left-4,bbox_bottom-sprite_height*3,bbox_left+4,bbox_bottom-sprite_height*2,obj_solid,0,0))
	  { vspeed=-jumpspeed; }   
   }

}else{ Target=TargetMode.usb; }


//Start targeting the player if it keeps staying close
if(!collision_rectangle(bbox_left-100,bbox_top-12,bbox_right+100,bbox_bottom,obj_playerparent,0,0)){

   if(annoyance==-1){ annoyance=4*room_speed; }

   if(annoyance>0){annoyance--;}else{Target=TargetMode.usb;}
  

}