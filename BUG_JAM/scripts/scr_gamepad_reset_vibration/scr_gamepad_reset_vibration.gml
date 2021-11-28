// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_gamepad_reset_vibration(forceL= 0,forceR = 0, time = 0){
      
	  
	  for (var g=0; g<gamepad_get_device_count(); g++) {
		   gamepad_set_vibration(g, forceL, forceR);
		   with(obj_persistent){alarm[1]=max(time,1);}
	  }
}