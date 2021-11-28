/// @description Insert description here
// You can write your code in this editor
draw_self();

var _s = sin(current_time*0.005);

var _Y = bbox_top+4*_s;
var _X = x;

draw_set_colour(c_white);
draw_triangle(_X,_Y,_X+6,_Y+12,_X-6,_Y+12,0);