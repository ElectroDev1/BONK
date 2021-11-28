/// @description Groundpound land
  if(x<__view_get( e__VW.XView, 0 )+200)||(x>__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )-200){
 scr_sfx_play_at_position(snd_bigland,1,
 __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )/2-x
,__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )/2-y,0,100,300,1);
 
}else{ scr_sfx_play(snd_bigland,1); }

 //Xscale=1.5;
 //Yscale=0.5;
 scr_gamepad_reset_vibration(0.8,0.8,6);
 jumpforce=jumpforce_super;
 groundP_special=groundP_addforce;
 alarm[5]=8;
 obj_camera.shakeV = 12;
 
 if(global.effects){
              
 with(instance_create(x,y+4,obj_effect_method)){
      sprite_index=spr_checkpoint_ring;  image_yscale=0.025; image_xscale=0.025;  image_alpha=1.4; 
 
      my_method = function(){
		if(image_xscale<100){image_xscale+=0.025;}
		if(image_alpha>0){image_alpha-=0.04;}else{instance_destroy();}
	  }
 
      my_draw_method = function(){
		draw_set_blend_mode(bm_add); 
		draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,0,image_blend,image_alpha);
		draw_set_blend_mode(bm_normal);  
	  }

}
 

 }

//Little bounce and really small boost if holding a direction
if(Movement!=0){
	state=Playerstate.jump; 
	y--;
    Vsp_super=-6;
	roll = true;
    Non_volountary_mov=7*Dir;
}
