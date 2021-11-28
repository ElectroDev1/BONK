/// @description Insert description here
// You can write your code in this editor
movespeed = 6;
dir = 1;
grav = 0.4;
max_vspeed = 6;

if(place_meeting(x,y,obj_semisolid)
||place_meeting(x,y,obj_slopeparent)){
   event_user(0);	
}