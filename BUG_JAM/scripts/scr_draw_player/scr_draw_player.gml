/// @description scr_draw_player();
function scr_draw_player() {
	if(sprite_exists(sprite_index)){ SPR=sprite_index; }else{ SPR=spr_controller; }

	draw_sprite_ext(SPR,image_index,round(x),floor(y)+Yoffset
	,1*sign(Dir),1,Angle,image_blend,1);




}
