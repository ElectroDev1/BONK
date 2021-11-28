/// @description Insert description here
// You can write your code in this editor
time++;

_sin = sin(time/10);


switch(Page){

       case 0:
	       if(keyboard_check_pressed(vk_space)){
			  Page = 1;   
		   }
		   
		   if(keyboard_check_pressed(vk_f2)){
			  Page = 0.5;   
		   }
		   menuY=lerp(menuY,0,0.2);
		   menuX=lerp(menuX,0,0.2);
	   break;
	   
	   case -1:
	   
	      if(keyboard_check_pressed(vk_space)){
			  Page = 0;   
		   }
		   
		   menuX=lerp(menuX,-room_width,0.2);
	   
	   break;
	   
	   case 0.5:
	   
	      if(keyboard_check_pressed(vk_f2)){
			  Page = 0;   
		   }
		   
		   menuX=lerp(menuX,room_width,0.2);
	   
	   break;
	   
	   case 1:
	       menuY=lerp(menuY,-room_height,0.2);
		   
		   mission_X=lerp(mission_X,-room_width*missionpos,0.4);
		   
		   if(scr_input_check_pressed(input.right)){
			  if(missionpos+1>=maxmission){
				 missionpos=maxmission-1;
				 mission_X=-8;
			  }
		   }
		   
		   if(keyboard_check_pressed(vk_escape)){
			  Page = 0;   
		   }
		   
		   if(keyboard_check_pressed(vk_enter)){
			 audio_sound_gain(global.stream,0,500)  Page = 2; alarm[0] = 60; obj_persistent.fade=1;
		   }
		   
	   break;
	   
	   case 2: menuY=lerp(menuY,-room_height*2,0.2);  break;
	
}