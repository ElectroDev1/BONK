/// @description Cancel groundpound



var MetalCollision=collision_rectangle(
bbox_left,bbox_bottom-1,bbox_left+4,bbox_bottom+4,obj_metal_block,true,false);

if(MetalCollision){
   with(MetalCollision) hurt=1;
}


var MetalCollision=collision_rectangle(
bbox_right-4,bbox_bottom-1,bbox_right,bbox_bottom+4,obj_metal_block,true,false);

if(MetalCollision){
   with(MetalCollision) hurt=1;
}

grav=0;
//Vsp=0;



if(!onfloor){state=Playerstate.fall; sprite_index=Sprite_fall[SkinImage];}else{state=Playerstate.idle;}

groundP=false;




