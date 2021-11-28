/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
stop=0;
Target=999
switch(Target){

       case TargetMode.usb: event_user(1); stop=1; if(hspeed!=0){sprite_index=walk_sprite;} break;
       case TargetMode.usb_exit:knock_res=1; event_user(2);stop=1;if(hspeed!=0){sprite_index=walk_sprite;} break;
       case TargetMode.player:knock_res=1; event_user(3);stop=1;if(hspeed!=0){sprite_index=walk_sprite;} break;
	   case TargetMode.insert:knock_res=2; event_user(5);stop=0; break;
}

if(Target==999){ event_user(6); }