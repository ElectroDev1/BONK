/// @description Costume change effect
// You can write your code in this editor


if(global.effects){

for(var a=0; a<359; a+=irandom_range(20,80)){

    with(instance_create(x,y-16,obj_effect)){
    
         
         sprite_index=spr_smoke_bubble;
         image_speed=0.5;
         var R=random_range(1.8,2);
         Xscale=R
         Yscale=R;
         Xscale_D=0; Yscale_D=0;
         image_alpha=1.6;
         alpha_des=1; alpha_spd=0.08;
         var D=choose(-1,1);
         direction=a;
         rot_speed=8*D
         speed_O=5;
         depth=-4;
    }

}


}