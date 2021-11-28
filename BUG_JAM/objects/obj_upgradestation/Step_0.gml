/// @description Insert description here
// You can write your code in this editor
if(place_meeting(x,y,obj_playerparent)){

   if(!VIS){
	  
	  if(scr_input_check_pressed(input.up)){
		 event_user(0);
	  }
	  
   }

}

if(scr_input_check_pressed(input.right)||scr_input_check_pressed(input.left)){

   if(VIS){
	
	  event_user(1);
	
   }

}
