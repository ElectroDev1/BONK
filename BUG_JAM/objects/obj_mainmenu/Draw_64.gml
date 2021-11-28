/// @description Insert description here
// You can write your code in this editor



backX-=0.5; backY-=0.75;
/*
if(backX+WINDOW_W<0){backX=0;}
if(backX>WINDOW_W){backX=0;}

if(backY+WINDOW_H<0){backY=0;}
if(backY>WINDOW_H){backY=0;}

draw_sprite(spr_checker,0,backX,backY);
draw_sprite(spr_checker,0,backX+sprite_get_width(spr_checker),backY);
draw_sprite(spr_checker,0,backX,backY+sprite_get_height(spr_checker));
draw_sprite(spr_checker,0,backX+sprite_get_width(spr_checker),backY+sprite_get_height(spr_checker));
*/


display_set_gui_maximize(global.Window_S+1,global.Window_S+1);

bktglitch_activate();

// Quickly setting all parameters at once using a preset
bktglitch_config_preset(BktGlitchPreset.B);


l=3;

switch(l){
  default:BktGlitch_config(0.000000, 0.016667, 1.000000, 0.100000, 0.000000, 0.200000, 1.000000, 0.200000, 0.150000, 0.500000, 0.004000, 0.002500, 0.500000, 1.000000, 0.000000);
    break;
	
  case 1:
bktglitch_config(0.034691, 0.200878, 1.420197, 0.237079, 0.269476, 0.534207, 3.206570, 0.384812, 0.038037, 0.968539, 0.028135, 0.160268, 0.227474, 0.200000, 0.407809);
    break;
	
  case 2:
 
bktglitch_config(0.006532, 0.016052, 1.303121, 0.073653, 1.000000, 0.121241, 3.333333, 0.037716, 0.755391, 0.603150, 0.046000, 0.006008, 3.996999, 0.166667, 0.606582);
  break;
  
  case 3:
bktglitch_config(0.002333, 0.136667, 2.669277, 0.126667, 1.000000, 0.846667, 13.666667, 0.026667, 0.526667, 0.181186, 0.009333, 0.000000, 0.000000, 0.366667, 0.514121);
  break;
}

// draw_surface(application_surface, 0, 0);
draw_surface_stretched(application_surface, 0, 0, display_get_gui_width(), display_get_gui_height());

// Done with the shader (this is really just shader_reset)!
bktglitch_deactivate();

if(!global.won){
draw_set_color(c_black)draw_set_alpha(0.3);
draw_rectangle(0,0,room_width,room_height,0);
draw_set_color(c_white)draw_set_alpha(1);
}

if(!surface_exists(menusurf)){
   menusurf=surface_create(room_width,room_height);	
}else{
	
	surface_set_target(menusurf);
	
	draw_clear_alpha(c_white,0);
	
	draw_sprite_ext(spr_logo,0,room_width/2,110+20*(menuY/10)
	,0.175+0.1*_sin/10,0.175+0.1*_sin/10,4*(sin(time/20)),c_white,1);
	
	
	var _rectH = 50+max(-0.25,18*_sin);
	var _rectY = room_height-40;
	
	draw_set_colour(rgb_to_bgr($3595B2));draw_set_alpha(0.9);
	draw_rectangle(0,_rectY-_rectH/2,room_width,_rectY+_rectH/2,0);
	draw_set_colour(c_white);draw_set_alpha(1);
	draw_set_halign(fa_center); draw_set_valign(fa_middle);
	draw_text_transformed(room_width/2,_rectY,"PRESS SPACE",1.5+max(-0.25,0.5*_sin),1.5+max(-0.25,0.5*_sin),0);
	
	draw_set_halign(fa_left); draw_set_valign(fa_top);
	
	draw_text_transformed(4,2,"Controls - F2",0.5,0.5,0)
	
	surface_reset_target();
	
	if(menuY+room_height>0)&&(menuY<room_height){
	
	   draw_surface(menusurf,menuX,menuY);
	
	}
	
}


if(!surface_exists(thanksurf)){
   thanksurf=surface_create(room_width,room_height);	
}else{
	
	surface_set_target(thanksurf);
	
	draw_clear_alpha(c_white,0);
	
	draw_set_halign(fa_center); draw_set_valign(fa_top);
	draw_text_transformed(room_width/2,10,"THANK YOU FOR PLAYING",1,1,0)
	draw_text_transformed(room_width/2,40,"--Credits--",0.5,0.5,0)
	draw_text_transformed(room_width/2,55,"--Programming, music, art--\nElectro\nbtkGlictch shader made by Blokatt"+
	"\n Exporting by Berry"+
	"\nAdditional audio by Nintendo\nOriginal idea by Valve"+
	"\n\nSpecial thanks to\nall my friends who followed this game's progress through the weeks\n"+
	"\nPress Space to exit"
	
	,0.5,0.5,0)
	

	

	
	surface_reset_target();
	
	var _X = menuX+room_width;
		
	if(_X<room_width)&&(_X+room_width>0){	
	draw_surface(thanksurf,menuX+room_width,menuY);
	}
}


if(!surface_exists(controlsurf)){
   controlsurf=surface_create(room_width,room_height);	
}else{
	
	surface_set_target(controlsurf);
	
	draw_clear_alpha(c_white,0);
	
	draw_sprite(spr_controls,0,32,24);
	
	draw_set_halign(fa_right);draw_set_valign(fa_bottom);draw_set_colour(c_white);
	draw_text_transformed(room_width-4,room_height-2,"Go back - F2",0.5,0.5,0)
	
	surface_reset_target();
	
	var _X = menuX-room_width;
		
	if(_X<room_width)&&(_X+room_width>0){	
	draw_surface(controlsurf,menuX-room_width,menuY);
	}
}



if(!surface_exists(missionsurf)){

   missionsurf=surface_create(room_width,room_height);
	
}else{

   surface_set_target(missionsurf);
   

   var _rectY = 20;
   var _rectH = room_height-_rectY-20;
   
   draw_set_colour(rgb_to_bgr($3595B2));draw_set_alpha(0.9);
   draw_rectangle(0,_rectY,room_width,_rectY+_rectH,0);
   draw_set_alpha(1); draw_set_colour(c_white);
   draw_set_halign(fa_center); draw_set_valign(fa_top);
   draw_text_transformed(room_width/2,_rectY,"MISSION SELECT",1,1,0);
   
   
   #region Mission select
   
   for(var a=0; a<maxmission; a++){
	
	   var _X = mission_X+room_width*a;
	   
	   
	   bktglitch_activate();

       if(global.datamap[? "Grade_"+string(a)]==7){

bktglitch_config(0.003333, 0.050000, 0.080000, 0.720000, 0.533333, 0.593333, 4.500000, 0.260000, 0.240000, 0.000000, 0.009667, 0.000000, 2.333333, 0.200000, 0.524996);
	   }

	   draw_sprite(mission_icon[a],0,_X+50,_rectY+80);
	   
	   bktglitch_deactivate();
	   
	   draw_set_halign(fa_center);
	   draw_text(_X+room_width/2,_rectY+30,"-"+mission_name[a]+"-");
	   
	   draw_set_halign(fa_left);
	   draw_text_transformed(_X+room_width/2+10,_rectY+70,"Record:",1,1,0)
	   
	   draw_text_transformed(_X+room_width/2+10,_rectY+100,"Money: "+string(global.datamap[? "Money_"+string(a)])+"$",0.5,0.5,0);
	  // draw_text_transformed(_X+room_width/2+10,_rectY+120,Grade[ global.datamap[? "Grade_"+string(a)] ],2,2,0);
	
	   var image = 0;
	   
	   var _grade = global.datamap[? "Grade_"+string(a)];
	   
	   if(_grade > 0){ image=1;}
	   if(_grade > 3){ image=2;}
	   if(_grade > 5){ image=2;}
	
	   /*if(_grade!=7){
         draw_sprite(spr_cups,image,_X+room_width/2+25,_rectY+120);
	   }*/
   
   }
   
   #endregion
   
   draw_set_halign(fa_center); draw_set_valign(fa_bottom);
   draw_text_transformed(room_width/2,_rectY+_rectH-5,"PRESS ENTER TO START",1,1,0);
   
   surface_reset_target();

   var _Y = menuY+room_height;

   if(_Y+room_height>0)&&(_Y<room_height*2){
	
	   draw_surface(missionsurf,menuX,menuY+room_height);
	
   }
	

}

display_set_gui_maximize(1,1);
