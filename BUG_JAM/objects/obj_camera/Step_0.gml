/// @description Insert description here
// You can write your code in this editor

//shakeX*=0.9;
//shakeY*=0.9;
//if(keyboard_check_pressed(ord("E"))){ shakeY = 10; shakeTime=100; }

shakeTime*=0.9;

var _ranx = random_range(-shakeX*bool(shakeTime),shakeX*bool(shakeTime));
var _rany = random_range(-shakeY*bool(shakeTime),shakeY*bool(shakeTime));

var _cw = camera_get_view_width(view_camera[0]);
var _ch = camera_get_view_height(view_camera[0]);

var _movx = keyboard_check(vk_right)-keyboard_check(vk_left);
var _movy = keyboard_check(vk_down)-keyboard_check(vk_up);

switch(followObject){

case -4:
_fx +=_movx; 
_fy +=_movy;
break;

case "mouse":
_fx = lerp(_fx,mouse_x-_cw/2,interpSpeed)+xoffset;
_fy = lerp(_fy,mouse_y-_ch/2,interpSpeed)+yoffset;
break;

}

if(instance_exists(followObject)){

var _tx = followObject.x;
var _ty = followObject.y;

var _extra = 0;

//if(followObject==obj_playerparent){ _extra = 80*followObject.Dir; }

_fx = ceil( lerp(_fx,_tx-_cw/2+_extra,interpSpeed)+xoffset )
_fy = ceil( lerp(_fy,_ty-_ch/2,interpSpeed)+yoffset )

}

_fx = max(_fx,0);
_fx = min(_fx,room_width-_cw);
_fy = max(_fy,0);
_fy = min(_fy,room_height-_ch);

x=_fx; y = _fy;
camera_set_view_pos(view_camera[0],floor(_fx+_ranx),floor(_fy+_rany));