/// @description Insert
// You can write your code in this editor
depth = 10;
if(instance_exists(obj_gate)){

if(vspeed!=0){
x=scr_approach(x,obj_gate.x,og_movespeed);
}

if(sprite_width>12){ image_xscale-=0.1 }

if(bbox_top>obj_gate.bbox_bottom+300){
   
   
   obj_mvm_controller.mvm_state = MVMSTATE.lose;
   
   with(obj_mvm_controller){ alarm[2] = 12*room_speed; }
   
   scr_play_music("wave_lost.ogg",0,0,0.5);
   
   instance_destroy();
   
}

}

hspeed = 0; stop=0; movespeed=0; 

if(image_index>=image_number-1){image_speed=0; image_index=image_number;}

if(image_index>=2 && image_index<3){ y-=4; vspeed=-10; noclip=true; mask_index = spr_nothing; }
