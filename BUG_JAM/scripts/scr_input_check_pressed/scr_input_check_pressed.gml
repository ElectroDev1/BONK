/// @description scr_input_check_pressed(button)
/// @param button
function scr_input_check_pressed(argument0) {
	var _gamepad  = 0;
	var _key =0;

	//Go throught all gamepad input
	if(global.button[argument0]!=noone){
	for (var g=0; g<gamepad_get_device_count(); g++) {

	    _gamepad += gamepad_button_check_pressed(g, global.button[argument0]);
    
	}
	}

	if(global.keyboard[argument0]!=noone){
	   _key=keyboard_check_pressed(global.keyboard[argument0]);
	}

	return _key+_gamepad



}
