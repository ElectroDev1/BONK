/// @description obj_effect
mode          =bm_normal;
Hitbox_color=c_yellow;
//Offset for checking if outside the view
Viewoffset=0;

//Start position
StartX        =x;  
StartY        =y;
//Destroy variables
anim_des      =0;//If destroying at animation end
alpha_des     =0;//Fade alpha
alpha_spd     =0;//Fade speed

//Other
rot_speed     =0;//Rotation speed
Color         =c_white;//The color of the sprite

//Scale
Xscale        =1;//Width
Yscale        =1;//Height
Xscale_D      =1;//Final width
Yscale_D      =1;//Final height
Xscale_S      =0;//Speed to change the width
Yscale_S      =0;//Speed to change the height

//Speed
speed_D       =0;//Destination speed
speed_S       =0;//Speed to change the speed (ehe)
speed_O       =0;//Starting speed
SPD           =0;//Final speed

//Movement
hsp           =0;//Final horizontal speed
vsp           =0;//Final vertical speed
grav          =0;//Gravity force
weight        =0;//Max gravity
movespeed     =0;//Normal speed
dir           =0;//Direction
Friction      =0;//Friction
Friction_dec  =0;//Frction decrease

alarm[0]=1;

destroytime   =-1;//

