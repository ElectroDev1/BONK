/// @description Insert description here
// You can write your code in this editor




display_set_gui_maximize(global.Window_S+1,global.Window_S+1);

if(!surface_exists(mvm_game_surface)){
   mvm_game_surface = surface_create(WINDOW_W,WINDOW_H);	
}else{
	
	surface_set_target(mvm_game_surface);
	
	draw_clear_alpha(c_white,0);
	
	var _W = surface_get_width(mvm_game_surface);
	var _H = surface_get_height(mvm_game_surface);
	
	if(mvm_state!=MVMSTATE.win){
	
	  if(!keyboard_check(vk_tab)){
	
	 if(mvm_state!=MVMSTATE.over){
	   #region Base mvm things
	
	var _rectY = _H-20+bottomYoffset;
	var _rectPad = 2;
	var _rectW = 100;
	var _rectH = 25;
	var _rectMarg = 2;
	
	//Owned money
	UI_money = lerp(UI_money,spendable_money,0.2);
	UI_money = max(UI_money,0);
	UI_money = min(UI_money,spendable_money);
	
	draw_set_color(c_white);
	draw_rectangle(
	_W/2-_rectPad-_rectW,
	_rectY-_rectH/2,
	_W/2-_rectPad,
	_rectY+_rectH/2,0);
	
	draw_set_color(c_black);
	draw_rectangle(
	_W/2-_rectPad-_rectW+_rectMarg,
	_rectY-_rectH/2+_rectMarg,
	_W/2-_rectPad-_rectMarg,
	_rectY+_rectH/2-_rectMarg,0);
	
	draw_set_color(c_white);
	draw_set_halign(fa_left); draw_set_valign(fa_top);
	draw_text_transformed(
	_W/2-_rectPad-_rectW+_rectMarg+2,
	_rectY-_rectH/2+_rectMarg+2,
	"MONEY: ",0.5,0.5,0
	)
	
	draw_set_halign(fa_right); draw_set_colour(GREEN);
	draw_text_transformed(
	_W/2-_rectPad-_rectMarg-2,
	_rectY-_rectH/2+_rectMarg+2,
	string(round(UI_money))+"$",0.5,0.5,0
	)
	
	
	
	//Missed money
	draw_set_color(c_white);
	draw_rectangle(
	_W/2+_rectPad,
	_rectY-_rectH/2,
	_W/2+_rectPad+_rectW,
	_rectY+_rectH/2,0);
	draw_set_color(c_black);
	draw_rectangle(
	_W/2+_rectPad+_rectMarg,
	_rectY-_rectH/2+_rectMarg,
	_W/2+_rectPad+_rectW-_rectMarg,
	_rectY+_rectH/2-_rectMarg,0);
	
	draw_set_color(c_white);
	draw_set_halign(fa_left); draw_set_valign(fa_top);
	draw_text_transformed(
	_W/2+_rectPad+_rectMarg+2,
	_rectY-_rectH/2+_rectMarg+2,
	"MISSED: ",0.5,0.5,0
	)
	
	draw_set_halign(fa_right);
	draw_text_transformed(
	_W/2+_rectPad+_rectW-_rectMarg-2,
	_rectY-_rectH/2+_rectMarg+2,
	string(wave_missed_money)+"$",0.5,0.5,0
	)
	
	var _wave = mvm_wave+1;
	var _waveamt = mvm_wavecount;
	var _waveinfo_X = _W/2 + topXoffset;
	var _waveinfo_Y = 2  - topYoffset;
	
	draw_set_halign(fa_center); draw_set_valign(fa_top);
	draw_text_transformed(_waveinfo_X,_waveinfo_Y,"Wave: "+string(_wave)+"/"+string(_waveamt),0.5,0.5,0);
	
	var _waveR_width = 120;
	var _waveR_height = 12;
	var _waveR_padding = 2;
	var _waveR_margin = string_height("W")*0.5;
	
	/*draw_set_colour(c_white);
	draw_rectangle(_waveinfo_X-_waveR_width/2,_waveinfo_Y+_waveR_margin,
	_waveinfo_X+_waveR_width/2,_waveinfo_Y+_waveR_margin+_waveR_height,0);
	
	//Wave
	draw_set_colour(RED);
	draw_rectangle(_waveinfo_X-_waveR_width/2+_waveR_padding,
	_waveinfo_Y+_waveR_margin+_waveR_padding,
	_waveinfo_X-_waveR_padding+(_waveR_width/2)*(robots/_total_guys),
	_waveinfo_Y+_waveR_margin+_waveR_height-_waveR_padding
	,0);
	*/
	
	#endregion
	 }
	    //Specific HUD elements
	   switch(mvm_state){
		
		  case MVMSTATE.setup: //Setup
		       
			  if(loaded){ 
			   //Wave squares
			   draw_set_color(c_white);
			   var _arrayW = array_length(mvm_wave_robotlist);
			   var _amt = 0;
			   
			   var _sqPadding  = 4;
			   var _sqW = 24,_sqH = 24;
			   var _sqX      = _waveinfo_X;
			   var _sqY      = _waveinfo_Y+_waveR_margin+_waveR_height+4;
			   
			   for(var a=0; a<_arrayW; a++){
				   if(mvm_wave_robotlist[a]>0){ _amt++;  }      
			   }
			   
			   var _tW = _amt*(_sqW)+_sqPadding*(_amt-1);
			   
			  
			   
			   for(var a=0; a<_arrayW; a++){
				   if(a==0){_sqX=_waveinfo_X;}
				   if(mvm_wave_robotlist[a]>0){  
					   
					  if(a>0){_sqX+= _sqW+_sqPadding+1;}
					  
					   switch(a){
						   default: draw_set_colour(c_white); break;
						   case Robot.giant: draw_set_colour(RED); break;
					   }
					  
					  draw_rectangle(_sqX-_tW/2,_sqY,
					  _sqX+_sqW-_tW/2-1,
					  _sqY+_sqH-1,0);
					  
					  draw_sprite(spr_robot_icons,a,
					  _sqX-_tW/2+sprite_get_xoffset(spr_robot_icons),
					  _sqY+sprite_get_yoffset(spr_robot_icons) );
					  
					  draw_set_halign(fa_center); draw_set_valign(fa_top);
					  
					  var _robamt = mvm_wave_robotlist[a];
					  
					   draw_set_color(c_white);
					  draw_text_transformed(_sqX+_sqW/2-_tW/2,_sqY+_sqH+2,
					  string(_robamt),0.5,0.5,0);
					  
					  
				   }
			   }
			   
			    draw_set_halign(fa_center); draw_set_valign(fa_top);
			    draw_text_transformed(_waveinfo_X+1,_sqY+_sqH+16,"Press F4 to start",0.5,0.5,0);
				
				draw_set_alpha(abs(sin(current_time*0.005))); draw_set_colour(c_red);
			    draw_text_transformed(_waveinfo_X+1,_sqY+_sqH+16,"Press F4 to start",0.5,0.5,0);
				draw_set_alpha(1); draw_set_colour(c_white);
				
				draw_set_halign(fa_center); draw_set_valign(fa_middle);
				
				var _countY = _rectY-_rectH/2-18;
				var _countMargin = 11;
				
				draw_rectangle(_waveinfo_X-_countMargin-2,_countY-_countMargin-2,_waveinfo_X+_countMargin+2,_countY+_countMargin+2,0);
				draw_set_colour(c_black);
				draw_rectangle(_waveinfo_X-_countMargin,_countY-_countMargin,_waveinfo_X+_countMargin,_countY+_countMargin,0);
				draw_set_colour(c_white);
				draw_text_transformed(_waveinfo_X+1,_countY,string(countdown),0.5,0.5,0);
			   
			  }
			   
		  break;
		  
		  case MVMSTATE.win:
		   
		       draw_set_colour(c_white);
			   draw_set_halign(fa_center); draw_set_valign(fa_top);
			   
			   var _STR = "WAVE COMPLETED"
			   var _sSTR = "Wave results:\n\nMoney: "+string(wave_money)+"/"+string(wave_final_money)+"\nMissed money: "+string(wave_missed_money)+"\nGrade: "+Grade[wave_grade];
			   
			   draw_text(_W/2,20,_STR)
			   draw_text_transformed(_W/2,20+string_height(_STR)+10,_sSTR,0.5,0.5,0)
			   
			   show_debug_message("WON")
			   
		   
		  break;
		  
		  case MVMSTATE.lose:
		     
			    draw_set_colour(c_white);
			   draw_set_halign(fa_center); draw_set_valign(fa_top);
			   
			   var _STR = "YOU LOST"
			   
			   
			   draw_text(_W/2,20,_STR)
			   
			 
		  break;
		  
		  case MVMSTATE.over:
		   
		       draw_set_colour(c_white);
			   draw_set_halign(fa_center); draw_set_valign(fa_top);
			   
			   var _STR = "YOU WON"
			   var _sSTR = "Level results:\n\nMoney: "+string(total_money-starting_money)+"/"+string(level_final_money)+"\nMissed money: "+string(total_missed_money)+"\nGrade: "+Grade[total_grade];
			   
			   draw_text(_W/2,20,_STR)
			   draw_text_transformed(_W/2,20+string_height(_STR)+10,_sSTR,0.5,0.5,0)
			   
		   
		  break;
	   	
	}
	
	  }
	
	 if(keyboard_check(vk_tab)){
		 var _rectW = 120;
		 var _rectH = 140;
		
		 var _rectY = 40;
		 
		 draw_set_halign(fa_center); draw_set_valign(fa_top);
		 draw_set_colour(c_white);
		 draw_text_transformed(_W/2,5,"TOTALS",1,1,0)
		 
		  var _rectX = _W/2-20-_rectW;
		  
		  draw_set_colour(c_white);
		  draw_rectangle(_rectX-2,_rectY-2,_rectX+2+_rectW,_rectY+_rectH+2,0);
		  draw_set_colour(c_black);
		  draw_rectangle(_rectX,_rectY,_rectX+_rectW,_rectY+_rectH,0);
		  
		  draw_set_colour(c_white);draw_set_halign(fa_left); draw_set_valign(fa_top);
		  draw_text(_rectX+2,_rectY,"LEVEL");
		  draw_text_transformed(_rectX+2,_rectY+30,"Money:",0.5,0.5,0);
		  draw_text_transformed(_rectX+2,_rectY+50,"Missed:",0.5,0.5,0);
		  
		  draw_set_halign(fa_center);  draw_set_valign(fa_bottom)
		  draw_text_transformed(_rectX+_rectW/2,_rectY+_rectH-2,Grade[total_grade],2,2,0);
		  
		  draw_set_halign(fa_right); draw_set_valign(fa_top); draw_set_colour(GREEN);
		  draw_text_transformed(_rectX+_rectW-2,_rectY+30,string(total_money-starting_money)+"/"+string(level_final_money),0.5,0.5,0);
		  draw_set_colour(c_red);
		  draw_text_transformed(_rectX+_rectW-2,_rectY+50,string(total_missed_money),0.5,0.5,0);
		  
		  
		  var _rectX = _W/2+20;
		  
		  draw_set_colour(c_white);
		  draw_rectangle(_rectX-2,_rectY-2,_rectX+2+_rectW,_rectY+_rectH+2,0);
		  draw_set_colour(c_black);
		  draw_rectangle(_rectX,_rectY,_rectX+_rectW,_rectY+_rectH,0);
		  
		  draw_set_colour(c_white);draw_set_halign(fa_left); draw_set_valign(fa_top);
		  draw_text(_rectX+2,_rectY,"WAVE "+string(mvm_wave+1));
		  draw_text_transformed(_rectX+2,_rectY+30,"Money:",0.5,0.5,0);
		  draw_text_transformed(_rectX+2,_rectY+50,"Missed:",0.5,0.5,0);
		  
		  draw_set_halign(fa_center);  draw_set_valign(fa_bottom)
		  draw_text_transformed(_rectX+_rectW/2,_rectY+_rectH-2,Grade[wave_grade],2,2,0);
		  
		  draw_set_halign(fa_right); draw_set_valign(fa_top); draw_set_colour(GREEN);
		  draw_text_transformed(_rectX+_rectW-2,_rectY+30,string(wave_money)+"/"+string(wave_final_money),0.5,0.5,0);
		  draw_set_colour(c_red);
		  draw_text_transformed(_rectX+_rectW-2,_rectY+50,string(wave_missed_money),0.5,0.5,0);
		 
	  }
	
	}
	
	draw_set_colour(c_white);
	surface_reset_target();
    draw_surface(mvm_game_surface,0,0);

}

var _usbX=0;
var _usbY=0;
var _usb =1;

var _pX = WINDOW_W/2;

if(instance_exists(obj_playerparent)){ _pX = obj_playerparent.x; }

if(instance_exists(obj_usb)){
    _usbX=obj_usb.x-obj_camera._fx;	
    _usbY=obj_usb.y-obj_camera._fy;	
}
else if(instance_exists(obj_robot_parent)){
    with(obj_robot_parent){
	     if(leader==id){ _usbX=x-obj_camera._fx; _usbY=y-obj_camera._fy-32; }	
	}
}else{ _usb = false; }

_DIR = -1;
if(_usbX>_pX){_DIR = 1;}

_usbX=max(_usbX,6);
_usbX=min(_usbX,WINDOW_W-6);

_usbY=max(_usbY,6);
_usbY=min(_usbY,WINDOW_H-6);

if(_usb){
draw_triangle(_usbX,_usbY-6,_usbX+6*_DIR,_usbY,_usbX,_usbY+6,0)
}

display_set_gui_maximize(1,1);

draw_set_alpha(escape_time/10);

draw_set_halign(fa_left); draw_set_valign(fa_bottom);

var dots = "";
if(escape_time>1*room_speed){ dots="." }
if(escape_time>2*room_speed){ dots=".." }
if(escape_time>3*room_speed){ dots="..." }

draw_text(2,WINDOW_H*2-2,"Quitting"+dots);

draw_set_alpha(1);