/// @description scr_input_check(button)
/// @param button
function scr_input_check(argument0) {
	var _gamepad  = 0;
	var _key =0;

	//Go throught all gamepad input
	if(global.button[argument0]!=noone){
	for (var g=0; g<gamepad_get_device_count(); g++) {

	    _gamepad += gamepad_button_check(g, global.button[argument0]);
    
	}
	}

	if(global.keyboard[argument0]!=noone){
	   _key=keyboard_check(global.keyboard[argument0]);
	}

	return _key+_gamepad



}
