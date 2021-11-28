/// @description scr_gamepad_check_axis(axisIndex)
/// @param axisIndex
function scr_gamepad_check_axis(argument0) {
	for(var a=0; a<gamepad_get_device_count(); a++){
	if(gamepad_is_connected(a)){

   
   
	   if(argument0==gp_axislh){
	      return gamepad_axis_value(a,argument0)*global.Xaxis;
	   }
	   
	   if(argument0==gp_axislv){
	      return gamepad_axis_value(a,argument0)*global.Yaxis;
	   } 
   
	}
	}

    return 0;

}
