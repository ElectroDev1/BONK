/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

draw_set_colour(c_red);

if(delay<25){ draw_set_colour(c_white); }

if(delay<og_delay-40){
 	
    draw_line_width(
	  x+16*Dir,bbox_bottom-76,TX,TY,2);
	  
	  draw_circle(TX,TY,1.5,0);

}

draw_set_colour(c_white);