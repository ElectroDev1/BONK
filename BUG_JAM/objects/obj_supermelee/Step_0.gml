/// @description Insert description here
// You can write your code in this editor
if(image_index>=image_number-1){instance_destroy();}

if(instance_exists(obj_playerparent)){
   x= obj_playerparent.x+xoffset;	
   y= obj_playerparent.y;	
}