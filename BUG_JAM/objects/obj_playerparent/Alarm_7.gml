/// @description Start sprint

canmove=1;
Control=true;
Sprint_movement=4*Dir;
with(obj_camera){
     shake=4;
}

if(onfloor)
&&( (scr_input_check(input.down))||(scr_gamepad_check_axis(gp_axislv)>0.2)){
   Non_volountary_mov=(Sprint_boost_crouch+groundP_special)*Dir;
   
}
else{Non_volountary_mov=(Sprint_boost+groundP_special)*Dir;}

with(instance_create( x-8*Dir,y-16,obj_effect)){
     sprite_index=spr_ceilingstomp_effect;
     image_angle=-90;
     Xscale=other.Dir;
     anim_des=1; image_speed=0.5;
}

