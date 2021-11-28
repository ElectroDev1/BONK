/// @description Insert description here
// You can write your code in this editor

bktglitch_activate();

bktglitch_config(0.016000, 0.316667, 0.327901, 0.056459, 0.055803, 0.920925, 1.970659, 0.878266, 0.666667, 0.972640, 0.026000, 0.003293, 7.099330, 0.200000, 0.646033);


var _c = shader_get_uniform(shd_white_sprite,"u_color");
var _a = shader_get_uniform(shd_white_sprite,"u_alpha");

shader_set_uniform_f_array(_c,[1.0,1.0,1.0]);
shader_set_uniform_f(_a,1);

shader_set(shd_white_sprite);
shader_set_uniform_f(_a,1);

/*draw_sprite_ext(sprite_index,image_index,
x+random_range(-4,4),y+random_range(-4,4)
,image_xscale,image_yscale,image_angle,c_white,image_alpha);

draw_sprite_ext(sprite_index,image_index,
x+random_range(-4,4),y+random_range(-4,4)
,image_xscale,image_yscale,image_angle,c_white,image_alpha);*/

shader_reset();

var _shake = random_range(-2,2);

draw_sprite_ext(sprite_index,0,
x+_shake,y+_shake
,image_xscale,image_yscale,image_angle,c_white,image_alpha);

draw_sprite_ext(sprite_index,0,x+_shake,y+_shake,image_xscale,image_yscale,image_angle,c_black,alpha);


bktglitch_deactivate();