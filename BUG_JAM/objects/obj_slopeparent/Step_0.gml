/// @description Stay to the second image
image_index=1;
//Slopesensor
if(instance_exists(obj_playerparent)){
   if(obj_playerparent.Slopesensor==id){
      Color=make_colour_rgb(0,255,0);
   }
   else{ Color=c_white; }
}

event_inherited();

visible = false;