/// @description Insert description here
// You can write your code in this editor
draw_set_font(fnt_game);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
depth=999999;
/*draw_text(
5,0,
"FPS: "+string(fps)
);*/

display_set_gui_maximize(global.Window_S+1,global.Window_S+1)

draw_set_alpha(fade_alpha);draw_set_color(c_black);
draw_rectangle(0,0,WINDOW_W,WINDOW_H,0);
draw_set_alpha(1);draw_set_color(c_white);

display_set_gui_maximize(1,1)