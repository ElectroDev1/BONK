/// @description Effect logic and physics
if(global.cutscene==2){speed=0; exit;}
//Destroy
if(alpha_des){
   image_alpha=scr_approach(image_alpha,-0.1,alpha_spd);
   if(image_alpha<=0)instance_destroy();   
}

if(destroytime>-1){
   if(destroytime>0){destroytime--;}else{instance_destroy();}
}

//Rotation
image_angle+=rot_speed;

//Scale and speed
Xscale=scr_approach(Xscale,Xscale_D,Xscale_S);
Yscale=scr_approach(Yscale,Yscale_D,Yscale_S);

//Destroy based on scale
if(Xscale==0)&&(Yscale==0)&&(Xscale_D==0)&&(Yscale_D==0){instance_destroy();}

speed_O=scr_approach(speed_O,speed_D,speed_S);
speed=speed_O;

//Physic

//Friction
if(Friction>0){Friction-=Friction_dec;}
else if(Friction<0){Friction+=Friction_dec;}else{Friction=0;}

//Gravity
if(vsp<weight){vsp+=grav;}

//Final calculations
var hsp_final,vsp_final;

hsp = (movespeed+Friction)*dir;

//Move
x+=hsp;
y+=vsp;

