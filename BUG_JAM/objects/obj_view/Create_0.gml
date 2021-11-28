/// @description Insert description here
// You can write your code in this editor

width = 960/2;
height = 540/2;
surf=-4;
view_camera[0] = camera_create();

camera_set_view_size(view_camera[0],width,height);

uTime = floor(shader_get_uniform(shd_wave, "Time"));
uTexel = floor(shader_get_uniform(shd_wave, "Texel"));