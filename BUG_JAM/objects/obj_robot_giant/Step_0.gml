/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

time ++;
unvol_speed=0;


if(time%(10*room_speed)==0){
   with(instance_create_depth(x,bbox_bottom,depth+4,obj_effect_method)){
				    image_speed=0.5; sprite_index=spr_explodion;
					myvar=0;
					my_method=function(){
					   	if(image_index > image_number-1){ instance_destroy(); }
						
						if(image_index<=1)&&(myvar==0){
						var _p = collision_rectangle(bbox_left+5,bbox_top+20,bbox_right-5,bbox_bottom,obj_playerparent,0,0);	
   if(_p){
	 ;
	  
	  with(_p){
		  
		 if(!invincible){ 
		  
		   if(x>other.x){ Non_volountary_mov = 6 }  
		   else{ Non_volountary_mov = - 6; } 
		   HP -= 20;
		   
		 }   
		   
	  }
	  myvar=1;
   }
						}
					}
					my_draw_method=function(){draw_self();}
			   }
}

delay--;
if(delay<=0){
	
   var _p = collision_rectangle(bbox_left+5,bbox_top+20,bbox_right-5,bbox_bottom+bottom_offset,obj_playerparent,0,0);	
   if(_p){
	  delay = og_delay;
	  
	  with(_p){
		  
		 if(!invincible){ 
		  
		   if(x>other.x){ Non_volountary_mov = other.attack_strength; }  
		   else{ Non_volountary_mov = - other.attack_strength; } 
		   HP -= other.attack;
		   
		 }   
		   
	  }
   }
}

var _spk = 0; 
if(global.upgrade[? "Slowdown"]){ _spk = sparked; }

if(leader==id){

   movespeed = (og_movespeed-1.5)-0.2*_spk;

}else{ movespeed = og_movespeed-0.2*_spk; }

if(sparktime>0){sparktime--;}else{ sparked = false; }


if(leader!=id)&&(instance_exists(obj_usb)){
   
   var _usb = collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_usb,0,0);
   
   if(_usb){
	  instance_destroy(_usb);
	  leader = id;
	  Target = TargetMode.usb_exit;
   }
   
}

switch(Target){

       case TargetMode.usb: event_user(1); stop=1; if(hspeed!=0){sprite_index=walk_sprite;} break;
       case TargetMode.usb_exit:knock_res=1; event_user(2);stop=1;if(hspeed!=0){sprite_index=walk_sprite;} break;
       case TargetMode.player:knock_res=1; event_user(3);stop=1;if(hspeed!=0){sprite_index=walk_sprite;} break;
	   case TargetMode.insert:knock_res=2; event_user(5);stop=0; break;
}

x=max(x,0);
x=min(x,room_width);