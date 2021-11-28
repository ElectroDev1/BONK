/// @description Initialize camera
if !view_enabled
    {
    view_visible[0] = true;
    view_enabled = true;
    }


global.camera = camera_create();
view_camera[0] = global.camera;
camera_set_view_size(view_camera[0],WINDOW_W,WINDOW_H);

shakeX=0;
shakeY=0;
shakeTime = 0;

_fx=0;
_fy=0;

followObject = obj_playerparent;
interpSpeed = 0.1;

xoffset = 0;
yoffset = 0;