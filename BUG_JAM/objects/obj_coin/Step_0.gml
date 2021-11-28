/// @description Insert description here
// You can write your code in this editor
event_inherited();
time++;



var _playercol = collision_circle(x,y,sprite_xoffset+20*global.upgrade[? "MoneyMagnet"],obj_playerparent,0,0);

if(!collided){

   if(time>lifetime-5*room_speed){

      if(time%10==0){
	     visible=!visible;   
      }

   }

   if(time>=lifetime){

      //Missed
	  obj_mvm_controller.wave_missed_money+=value;
	  obj_mvm_controller.total_missed_money+=value;

      instance_destroy();
	
   }

   if(_playercol){ collided = _playercol; }

   	
}else{

   visible = true;
   
   if(instance_exists(collided)){
	  x=lerp(x,collided.x,0.2);   
	  y=lerp(y,collided.y,0.2);  
	  
	  if(place_meeting(x,y,collided)){ event_user(0); }
   }else{
	  event_user(0);   
   }

}

/*
if(y>=room_height){
    event_user(0);	
}*/