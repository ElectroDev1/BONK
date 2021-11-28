/// @description Insert description here
// You can write your code in this editor

if(!VIS){exit;}

display_set_gui_maximize(global.Window_S+1,global.Window_S+1);
if(!surface_exists(upgrade_surf)){
 
    upgrade_surf = surface_create(WINDOW_W,WINDOW_H);
 
}
else{
	

   surface_set_target(upgrade_surf);
   
   draw_clear_alpha(c_black,0.5);
   
   window_set_cursor(cr_default);
   
   #region Draw the base
   
      var _baseX = 47;
      var _baseY = 47;
	  
	   for(var b=0; b<array_length(Upgrade); b++){
		  
		  
		  var _slipY = _baseY-31;
		  var _slipW = 64;
		  var _slipH = 31;
		  var _slipP = 17;
		  var _slipX = _baseX+19 + (64+17)*b;
		  
		  draw_set_colour(c_black);
		  draw_rectangle(_slipX-2,_slipY-2,_slipX+_slipW+2,_slipY+_slipH+2,0);
		  
		  draw_set_colour(rgb_to_bgr($5a6988));
		  
		  if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),
		  _slipX,_slipY,_slipX+_slipW,_slipY+_slipH
		  )){
			  draw_set_colour(rgb_to_bgr($7285ab));
			  if(mouse_check_button_pressed(mb_left)){ WeaponPage = b; }
		  }
		  
		  if(b==WeaponPage){ draw_set_colour(rgb_to_bgr($c0cbdc)); }
		  
		  draw_rectangle(_slipX,_slipY,_slipX+_slipW,_slipY+_slipH,0);
		  
		  draw_sprite(Pageicon[b],0,_slipX+_slipW/2,_slipY+_slipH/2);
		  
	  }
	  
      draw_sprite(spr_upgrade_base,0,_baseX,_baseY);
   
      //Upgrade description
      var _infoX = _baseX+20;
      var _infoY = _baseY+sprite_get_height(spr_upgrade_base)-60;
      draw_set_colour(rgb_to_bgr($5a6988));
      draw_rectangle(_infoX,_infoY,_infoX+96,_infoY+40,0);
   
      //Money
      var _moneyX = _infoX+96+8;
      var _moneyY = _infoY;
      draw_rectangle(_moneyX,_moneyY,_moneyX+58,_moneyY+38,0);
	  
	  draw_set_colour(GREEN);
	  draw_set_halign(fa_center);draw_set_valign(fa_middle);
	  draw_text(_moneyX+58/2+1,_moneyY+38/2+1,string(round(obj_mvm_controller.UI_money)));
	  
	  //Right buttons
	  draw_set_colour(rgb_to_bgr($c0cbdc));
	  
	  var _buttonX = _baseX+sprite_get_width(spr_upgrade_base)-178;
	  var _buttonY = _baseY+173;
	  
	    //Check for collision
	  if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),_buttonX,_buttonY,_buttonX+80,_buttonY+25)){
		 draw_set_colour(rgb_to_bgr($d5e1f2));  
		 if(mouse_check_button_pressed(mb_left)){ event_user(1); clear_upgrades(); obj_mvm_controller.spendable_money=obj_mvm_controller.total_money-disk_spent; }
	  }
	  
	  draw_rectangle(_buttonX,_buttonY,_buttonX+80,_buttonY+25,0);
	  
	  
	  draw_set_colour(rgb_to_bgr($c0cbdc));
	  
	  if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),_buttonX+96,_buttonY,_buttonX+159,_buttonY+25)){
		 draw_set_colour(rgb_to_bgr($d5e1f2));  
		 if(mouse_check_button_pressed(mb_left)){ event_user(1); }
	  }
	  
	  draw_rectangle(_buttonX+96,_buttonY,_buttonX+159,_buttonY+25,0);
	  
	  draw_set_colour(c_black);
	  draw_text_transformed(_buttonX+80/2+1,_buttonY+25/2+1,"REFUND ALL",0.5,0.5,0);
	  draw_text_transformed(_buttonX+96+(159-96)/2,_buttonY+25/2+1,"CONFIRM",0.5,0.5,0);
   
   #endregion
   
   #region Upgrade buttons
   
     for(var a=0; a<array_length(Upgrade[WeaponPage]); a++){
	
	     var _upgradeButtonX = _baseX+20;
	     var _upgradeButtonY = _baseY+23;
		 var _upgradeButtonW = 159;
		 var _upgradeButtonH = 56;
		 
		 if((a+1)%2==0){ _upgradeButtonX=_baseX+20+190; }
		 
		 if(a>=2){ _upgradeButtonY=_baseY+23+73; }
		 
		 draw_set_colour(rgb_to_bgr($f77622));
		 
		 if(UpgradePos==a){
			draw_set_colour(rgb_to_bgr($f77622));  
			draw_rectangle(_upgradeButtonX-2,_upgradeButtonY-2,_upgradeButtonX+_upgradeButtonW+2,_upgradeButtonY+_upgradeButtonH+2,0); 
		 }
		 
		 
		 
		  if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),_upgradeButtonX,_upgradeButtonY,_upgradeButtonX+_upgradeButtonW,_upgradeButtonY+_upgradeButtonH)){
			 UpgradePos=a;
			 draw_set_colour(rgb_to_bgr($f77622));  
			 draw_rectangle(_upgradeButtonX-2,_upgradeButtonY-2,_upgradeButtonX+_upgradeButtonW+2,_upgradeButtonY+_upgradeButtonH+2,0); 
		     if(mouse_check_button_pressed(mb_left)){  }
	      }  
		 
		 //Button
		 draw_set_colour(rgb_to_bgr($c0cbdc));
		 draw_rectangle(_upgradeButtonX,_upgradeButtonY,_upgradeButtonX+_upgradeButtonW,_upgradeButtonY+_upgradeButtonH,0);
		
		 
		 var _upgrade = Upgrade[WeaponPage,a][0];
		 var _price   = Upgrade[WeaponPage,a][1];
		 var _max     = Upgrade[WeaponPage,a][2];
		 var _icon    = Upgrade[WeaponPage,a][3];
		 var _title   = Upgrade[WeaponPage,a][4];
		 var _desc    = Upgrade[WeaponPage,a][5];
		 
		 var _iconX   = _upgradeButtonX+4;
		 var _iconY   = _upgradeButtonY+4;


         if(_price>obj_mvm_controller.spendable_money && global.upgrade[? _upgrade]<_max)
		 ||(global.upgrade[? _upgrade]>=_max){ shader_set(shd_simple_grayscale); }
		 draw_sprite_ext(_icon,0,_iconX,_iconY,2,2,0,c_white,1);
		 shader_reset();
		 
		 
		 var _textX   = _iconX + sprite_get_width(_icon)*2
		 
		 draw_set_colour(c_black);draw_set_halign(fa_left); draw_set_valign(fa_top);
		 draw_text_transformed(_textX+2,_iconY-2,_title,0.5,0.5,0);
		 draw_text_transformed(_textX+2,_iconY-2+string_height(_title)/2-3,string(_price),0.5,0.5,0);
		 
		 //Circles
		 for(var i=0; i<_max; i++){
		     draw_set_colour(rgb_to_bgr($5a6988));
			 
			 var _circleX = _iconX + sprite_get_width(_icon)*2 + 12 +22*i;
			 var _circleY = _iconY + 39;
			 
			 draw_set_circle_precision(128)
			 
			 if(global.upgrade[? _upgrade]>=i+1){ draw_set_colour(rgb_to_bgr($f77622)); }
			 
			 draw_circle(_circleX,_circleY,10,0);
		 }
		 draw_set_circle_precision(24);
		 
		 //Plus and minus buttons
		 var _statButtonX  = _upgradeButtonX+_upgradeButtonW-12;
		 var _statButtonYP = _upgradeButtonY+_upgradeButtonH-27;
		 var _statButtonYM = _upgradeButtonY+_upgradeButtonH-10;
		 
		 draw_set_colour(rgb_to_bgr($8b9bb4));
		 draw_set_halign(fa_center); draw_set_valign(fa_middle);
		 
		 var _alph = 1;
		 if(global.upgrade[? _upgrade]>=_max)||(obj_mvm_controller.spendable_money<_price){ _alph = 0; }
		 
		 if(point_in_circle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),_statButtonX,_statButtonYP,8))&&(_alph==1){
		     if(global.upgrade[? _upgrade]<_max)&&(mouse_check_button_pressed(mb_left)){ 

                //Buy
			    if(obj_mvm_controller.spendable_money>=_price){ 
					
				   switch(WeaponPage){
				     default: global.upgrade[? _upgrade]++; obj_mvm_controller.spendable_money-=_price;  break;
					 
					 case Pages.disk:
					      //Canteen logic
						  
						  //Check if we already bough a different type
					      for(var c=0; c<3; c++){
							  if(c!=a){ 
								  
								  if( global.upgrade[? Upgrade[WeaponPage,c][0]] >0){ 
									  global.canteen_amount=0;
									  obj_mvm_controller.spendable_money += Upgrade[WeaponPage,c][1] * global.upgrade[? Upgrade[WeaponPage,c][0]];
									   
									  global.upgrade[? Upgrade[WeaponPage,c][0]] = 0;
								  }
								  
							  }
						  }
						  
						  global.upgrade[? _upgrade]++;
						  global.canteen_amount++;
						  global.canteen=a;
						  obj_mvm_controller.spendable_money-=_price;
						 
						  
					 break;
				   }
					 
				}
			 }
		 }
		 
		 draw_sprite_ext(spr_upgrade_changebtn,0,_statButtonX,_statButtonYP,1,1,0,c_white,_alph);
		 
		 
		 
		 var _alph = 1;
		 if(global.upgrade[? _upgrade]<=0){ _alph = 0 }
		 
		 if(point_in_circle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),_statButtonX,_statButtonYM,8))&&(_alph==1){
		 
		    //Refund
		    if(global.upgrade[? _upgrade]>0)&&(mouse_check_button_pressed(mb_left)){ 
				
			   switch(WeaponPage){	
			       default: global.upgrade[? _upgrade]--; obj_mvm_controller.spendable_money+=_price; break;
				   
				   case Pages.disk:
				     global.upgrade[? _upgrade]--; obj_mvm_controller.spendable_money+=_price; disk_spent-=_price;
					 global.canteen--; if(global.upgrade[? _upgrade]<=0){global.canteen=-1;} 
					 global.canteen_amount--;
				   break;
			   }
			}
		 
		 }
		 		 
		 draw_sprite_ext(spr_upgrade_changebtn,1,_statButtonX,_statButtonYM,1,1,0,c_white,_alph);
		 
		 
		 
		 
		 //Description
		 draw_set_halign(fa_center); draw_set_valign(fa_middle); draw_set_colour(c_black);
		 if(UpgradePos==a){
		 draw_text_transformed(_infoX+96/2,_infoY+40/2,_desc,0.5,0.5,0);
		 }
		 
	
	 }
   
   #endregion
   
   draw_set_colour(c_white); draw_set_alpha(1);
   surface_reset_target();
   
   draw_surface(upgrade_surf,0,0);
	
}
display_set_gui_maximize(1,1);