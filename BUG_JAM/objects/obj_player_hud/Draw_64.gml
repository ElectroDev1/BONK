/// @description Insert description here
// You can write your code in this editor

display_set_gui_maximize(global.Window_S+1,global.Window_S+1);

if(!surface_exists(hud_surface)){
   hud_surface = surface_create(WINDOW_W,WINDOW_H);	
}else{
	
	var _W = surface_get_width(hud_surface);
	var _H = surface_get_height(hud_surface);
	
	surface_set_target(hud_surface);
	
	draw_clear_alpha(c_white,0)
	
	draw_set_colour(c_white);
	var _HPX = sprite_get_xoffset(spr_healthbar_base)+2;
	var _HPY = _H- (sprite_get_height(spr_healthbar_base)-sprite_get_yoffset(spr_healthbar_base)) - 10;
	
	if(instance_exists(obj_playerparent)){ _PHP = obj_playerparent.HP; _MHP = obj_playerparent.HP_max; _SP = obj_playerparent.Spark_lv; }
	
	
	if(!keyboard_check(vk_tab)){
	
	#region Disks
	
	 if(global.canteen_amount>0)&&(global.canteen>=0){
		
		 var disk = -1;
		 var _disk_X = _HPX+sprite_get_xoffset(spr_healthbar_base)+sprite_get_xoffset(spr_hud_disks)-3;
		 var _disk_Y = _HPY+sprite_get_yoffset(spr_healthbar_base)-sprite_get_yoffset(spr_hud_disks)
		 

          draw_set_colour(c_black);
		 draw_primitive_begin(pr_trianglestrip);
		 draw_vertex(_disk_X+45+2,_disk_Y-15-2);
		 draw_vertex(_disk_X+35+2,_disk_Y+15+2);
		 draw_vertex(_disk_X-00-2,_disk_Y-15-2);
		 draw_vertex(_disk_X-10-2,_disk_Y+15+2);
		 draw_primitive_end();
		 

		 draw_set_colour(c_white);
		 draw_primitive_begin(pr_trianglestrip);
		 draw_vertex(_disk_X+45,_disk_Y-15);
		 draw_vertex(_disk_X+35,_disk_Y+15);
		 draw_vertex(_disk_X-00,_disk_Y-15);
		 draw_vertex(_disk_X-10,_disk_Y+15);
		 draw_primitive_end();
		 
		
		   draw_set_colour(c_white);
		 
	
		
	 }
	
	#endregion

	
	#region Health bar
	


	
	
	draw_set_colour(c_white);
	
	
	
	draw_sprite_ext(spr_healthbar_base,0,_HPX,_HPY,1,1,0,YELLOW,1);
	
	//Barrrr
	gpu_set_colorwriteenable(1,1,1,0);
	
	draw_rectangle(_HPX-sprite_get_xoffset(spr_healthbar_base),
	_HPY+sprite_get_yoffset(spr_healthbar_base)-( (sprite_get_yoffset(spr_healthbar_base)*2) * (_PHP/_MHP)    ),
	_HPX+sprite_get_xoffset(spr_healthbar_base),
	_HPY+sprite_get_yoffset(spr_healthbar_base)  ,0);
	
	gpu_set_colorwriteenable(1,1,1,1);
	
	draw_sprite_ext(spr_healthbar_base,1,_HPX,_HPY,1,1,0,c_white,1);
	
	draw_set_colour(c_black);
	draw_set_halign(fa_center); draw_set_valign(fa_middle);
	
	
	
	draw_text(_HPX-8,_HPY-8,string(_PHP));
	draw_set_colour(c_white);
	
	#endregion
	
	#region Disk 2
	
	   if(global.canteen_amount>0){
		 

		 disk = global.canteen;
		 if(disk>-1){
		    draw_sprite(spr_hud_disks,disk,_disk_X,_disk_Y-2);
			
			draw_set_halign(fa_left); draw_set_valign(fa_top); draw_set_colour(c_black);
			draw_text_transformed(_disk_X+sprite_get_xoffset(spr_hud_disks),
			                      _disk_Y-10,
								  "x "+string(global.canteen_amount),0.5,0.5,0
			)
			draw_set_colour(c_white);
		 }
	
	  }
	
	#endregion
	
	#region Spark bar
	
	var _SPX = _W-105;
	var _SPY = _H- (sprite_get_height(spr_sparkbar_base)-sprite_get_yoffset(spr_sparkbar_base)) - 10;
	
	var _SPmargin = 3;
	var _SPwidth = 100;
	var _SPheight = 20;
	var _SPskew = 10;
	
	var _SPlvl = 0;
	if(instance_exists(obj_playerparent)){ _SPlvl =obj_playerparent.Spark_lv; }
	
	draw_set_colour(c_black);
	draw_primitive_begin(pr_trianglestrip);
	
	draw_vertex(_SPX+_SPskew-2,_SPY-2);//TL
	draw_vertex(_SPX+_SPwidth+2,_SPY-2);//TR
	
	draw_vertex(_SPX-2,_SPY+_SPheight+2);//DL
	draw_vertex(_SPX+_SPwidth-_SPskew+2,_SPY+_SPheight+2);//DR
	
	draw_primitive_end();
	
	draw_set_colour(YELLOW);
	draw_primitive_begin(pr_trianglestrip);
	
	draw_vertex(_SPX+_SPskew,_SPY);
	draw_vertex(_SPX+_SPwidth,_SPY);
	
	draw_vertex(_SPX,_SPY+_SPheight);
	draw_vertex(_SPX+_SPwidth-_SPskew,_SPY+_SPheight);
	
	draw_primitive_end();
	
	var _sin = sin(current_time*0.0075);
	
	if(_SP>=1){
	   draw_set_colour(c_white);
	   draw_set_alpha(max(_sin,0));
	draw_primitive_begin(pr_trianglestrip);
	
	draw_vertex(_SPX+_SPskew,_SPY);
	draw_vertex(_SPX+_SPwidth,_SPY);
	
	draw_vertex(_SPX,_SPY+_SPheight);
	draw_vertex(_SPX+_SPwidth-_SPskew,_SPY+_SPheight);
	
	draw_primitive_end();
	draw_set_alpha(1);
	}
	
	
	draw_set_colour(c_black);
	draw_primitive_begin(pr_trianglestrip);
	
	draw_vertex(_SPX+_SPskew+_SPmargin,_SPY+_SPmargin);
	draw_vertex(_SPX+_SPwidth-_SPmargin-2,_SPY+_SPmargin);
	
	draw_vertex(_SPX+_SPmargin,_SPY+_SPheight-_SPmargin);
	draw_vertex(_SPX+_SPwidth-_SPskew-_SPmargin,_SPY+_SPheight-_SPmargin);
	
	draw_primitive_end();
	draw_set_colour(c_white);
	draw_primitive_begin(pr_trianglestrip);
	
	draw_vertex(_SPX+_SPskew+_SPmargin,_SPY+_SPmargin);
	draw_vertex(_SPX+(_SPwidth-_SPmargin-2)*_SPlvl,   _SPY+_SPmargin);
	
	draw_vertex(_SPX+_SPmargin,_SPY+_SPheight-_SPmargin);
	draw_vertex(_SPX+(_SPwidth-_SPskew-_SPmargin)*_SPlvl,   _SPY+_SPheight-_SPmargin);
	
	draw_primitive_end();
	
	
	
    draw_sprite(spr_sparkbar_base,0,_SPX,_SPY);
	
	#endregion
	
	}
	
	surface_reset_target();
	
   draw_surface_ext(hud_surface,0,0,1,1,0,c_white,image_alpha);

}

display_set_gui_maximize(1,1)