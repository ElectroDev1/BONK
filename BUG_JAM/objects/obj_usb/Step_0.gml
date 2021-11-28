/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(lifetime>0){
   lifetime--;	
}else{ 
	
	with(obj_robot_spawner){
	    if(SPAWN_ID==0){ other.x=x; other.y=y; }	
	}
	
	}
	
if(y>=room_height){
   lifetime = 0;	
}