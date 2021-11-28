/// @description Insert description here
// You can write your code in this editor

display_set_gui_maximize(global.Window_S+1,global.Window_S+1)

var _sprX = 2;
var _sprY = 2;

var _rectX = _sprX+sprite_get_width(spr_robot_icons)+2;
var _rectY = _sprY+2;
var _rectPad = 2;
var _rectW = 140;
var _rectH = 20;

draw_set_colour(c_white);
draw_rectangle(_rectX-_rectPad,
_rectY-_rectPad,
_rectX+_rectW*(max_health/max_health)+_rectPad,
_rectY+_rectH+_rectPad,0);

draw_set_colour(RED);
draw_rectangle(_rectX,
_rectY,
_rectX+(_rectW*(HP/max_health)),
_rectY+_rectH,0);


draw_set_colour(c_red);
draw_rectangle(_sprX,_sprY,_sprX+sprite_get_width(spr_robot_icons)+1,
_sprY+sprite_get_height(spr_robot_icons)+2,0);

draw_sprite(spr_robot_icons,1,_sprX+sprite_get_width(spr_robot_icons)/2+1,
_sprY+sprite_get_height(spr_robot_icons)/2+1);

draw_set_colour(c_white);

display_set_gui_maximize(1,1)