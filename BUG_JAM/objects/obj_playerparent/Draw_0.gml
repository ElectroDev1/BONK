/// @description Draw the player

var _Sjump= 1

if(superJump==1)&&(_Sjump){//If the player can super jump

 if(SuperShine==1){//If it can draw the shine
 
    shader_set(shd_white_sprite);
	
	 var _c = shader_get_uniform(shd_white_sprite,"u_color");
	 var _a = shader_get_uniform(shd_white_sprite,"u_alpha");
	 
	 shader_set_uniform_f_array(_c,[1.0,1.0,1.0]);
	 shader_set_uniform_f(_a,1);
	
      scr_draw_player();
	  
    shader_reset();    
    
 }
 else{//If it can't draw the shine
 
    scr_draw_player();
 
 }
}//If it can't superjump, just draw normally
else{ 


  
  scr_draw_player(); 
  
  if(invincible){
	  shader_set(shd_white_sprite);
	
	 var _c = shader_get_uniform(shd_white_sprite,"u_color");
	 var _a = shader_get_uniform(shd_white_sprite,"u_alpha");
	 
	 shader_set_uniform_f_array(_c,[1.0,0.0,0.0]);
	 shader_set_uniform_f(_a,max(min(sin(current_time*0.0075),0.8),0.4));
	
      scr_draw_player();
	  
    shader_reset();
  }
  
}

if(global.debug){
   //depth=-10;
   
   if(!Slopesensor){
   draw_set_colour(c_yellow);
   }else{
   draw_set_colour(make_colour_rgb(0,255,0));
   }
   draw_line(x,y-16,x,y+16);
   draw_set_colour(c_white);
}
//else{depth=0;}
//Deal with Xscale and Yscale
Xscale=scr_approach(Xscale,Xscale_F,0.1);
Yscale=scr_approach(Yscale,Yscale_F,0.1);


if(Spark_lv>=1)&&(Control){
	
   Spark_effect_alpha=scr_approach(Spark_effect_alpha,mouse_check_button(mb_right),0.25);
   
   var _mouse_direction = point_direction(x,y-sprite_yoffset/3,mouse_x,mouse_y);
   var _sparkoffset = 48;
   
   draw_sprite_ext(
     spr_spark_aim,0,
	 x+20*Dir+lengthdir_x(_sparkoffset,_mouse_direction)
	 ,bbox_bottom-64+24+lengthdir_y(_sparkoffset,_mouse_direction),
	 1,1,_mouse_direction,c_white,Spark_effect_alpha
   )
   
   
}else{
   Spark_effect_alpha=scr_approach(Spark_effect_alpha,0,0.25);	
}

depth=-2;