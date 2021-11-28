/// @description Insert description here
// You can write your code in this editor
for (var g=0; g<gamepad_get_device_count(); g++) {
	 gamepad_set_vibration(g, 0, 0);
}