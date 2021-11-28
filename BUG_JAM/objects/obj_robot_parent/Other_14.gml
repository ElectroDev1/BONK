/// @description Get hurt
// You can write your code in this editor
show_debug_message("Ouch by "+string(global.attackpower)+" HP left: "+string(HP));
HP -= global.attackpower;

if(Target == TargetMode.insert){
	Target = TargetMode.usb_exit;
	movespeed=og_movespeed;
	stop=1;
}

if(sparked)&&(instance_exists(obj_supermelee)){
   with(obj_playerparent){
	    HP += round(global.attackpower/4);
		if(HP>HP_max){HP=HP_max;}
   }
}

   //var _X = obj_supermelee.x;
   var _d = bbox_right;
   //if(_X<x){ _d = bbox_left; }
   
   Xscale=1.2;Yscale=0.8;
   
   alarm[0]=10;
   
  /* with(instance_create_depth(_d+irandom_range(-2,2),obj_supermelee.y-sprite_height/2+irandom_range(-3,3),depth-4,obj_effect_method)){
	    sprite_index = spr_hurteffect;
		image_xscale=1.2; image_yscale=1.2;
		my_draw_method=function(){draw_sprite(sprite_index,0,x,y)}
		my_method=function(){
		    	if(image_xscale>0){image_xscale-=0.1;}else{instance_destroy();}
				
				image_yscale=image_xscale;
				
		}
   }*/



if(HP<=0){


   event_user(0);
   
   instance_destroy();

}