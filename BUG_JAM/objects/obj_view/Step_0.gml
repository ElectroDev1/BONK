/// @description Insert description here
// You can write your code in this editor

depth=-4;
instance_activate_all();

var _Y = ( keyboard_check(vk_down)-keyboard_check(vk_up) )*4;
y+= _Y;


var _X = ( keyboard_check(vk_right)-keyboard_check(vk_left) )*4;
x+= _X;