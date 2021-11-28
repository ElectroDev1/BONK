/// @description Player parent object
with(obj_camera){ _fx= x; _fy= y; }
show_debug_message("PLAYERS:"+string(instance_number(obj_playerparent)))

if(instance_number(obj_playerparent)==2){
	obj_playerparent.Control=true;
   instance_destroy();	
}

HP_max = 125;
HP = HP_max;

Spark_lv = 1;

Spark_effect_alpha = 0;


update_time = 0;

invincible=0;
invincible_time = 8*room_speed;

/*
This is where all the basic code for the player is stored, 
collision, behaviour.. and can then be linked to new
children object to have different players doing different stuff
*/

Yoffset=0;

is_water_surface_collision = false;

//Sprite
SPR                  =spr_controller;

//Debug variables
debug                =false; //If this is true, the player will be able to float around the level

//If this is true the object will use the animation script
Animate              =true;

//If we're on a floor
onfloor              =1;


//Step sound effect variables

//This variable is used to know when to play a step sound effect
Step                 =0;

//This is to not make the player play a step sound effect every frame
step_offset          =0;

//The type of floor you're stepping on
floortype            =0;

//Step sound variable
SND                  =0;     


//Player states
enum Playerstate{
     idle,move,jump,fall,sprint,groundpound,attack
}

//State vairable
state                =Playerstate.idle;

//If this is true, the player will stay to the roll animation
roll                 =false;

//Collision checks
SOLIDL               =0; //Left collision check
SOLIDR               =0; //Right collision check
SOLIDL_V             =0; //Left collision check that also accounts for the player's speed
SOLIDR_V             =0; //Right collision check that also accounts for the player's speed

//Slope collision check
Slopesensor          =0;

//The angle of the slope you're on
Slope_angle          =0;

//If set to false, the player will just not be able to move
canmove              =1;

//If this is false, the player can't be controlled normally
//Use this for cutscenes
Control              =1;

//If the player can start a fasing trail
ghostcan             =0;
ghost                =0;


//Vertical movement

//Vertical speed variables
Vsp                  =0; //Normal vertical speed
Vsp_super            =0; //The vertical speed given by the super jump
Vsp_carry            =0; //This is the vertical speed that can be affeted by other objects
Vsp_final            =0; //The final vertical speed given by adding all the previous ones toghether

//The value the gravity should be when falling
weight               =0.655;

//The speed at which the vsp should increase when falling
grav                 =0;

//The vertical speed given when starting a jump
jumpforce            =10;
jumpforce_normal      = jumpforce; //Normal jump force
jumpforce_super       = jumpforce+2; //Ground pound jump force

//Nummber of jumps you can make
jumps                =1;

//The amount of jumps given when landing back on a surface
jumpsmax             =global.max_jumps;

//The level of the super jump (from 0 to 100)
superJump_level      =0;

//When releasing for a super jump, the jump force increased with this variable is set as the vsp
superboost           =4.5;

//if this variable is 1, you can do a super jump
superJump            =0;

//The speed at which the superJump_levbel variable should increase when charging a super jump
superjump_incr       =1.1;

//If this is true, a white shader will be applied to the player when a super jump is charged
SuperShine           =0;



//Left and right movement
Hmove                =1;//This will be multiplied to the final hsp

Movement             =0; //This is basically the imput directio
Player_movement      =0; //The walking speed of the player
Non_volountary_mov   =0; //Non volountary movement speed
Sprint_movement      =0; //The sprint speed

Player_mov_incr      =0.5//0.205; //The speed at which the walking speed should increase when on a floor
Player_mov_incr_sprint=0.255//0.185;//The speed at which the dashing speed should increase when on a floor
Player_mov_incr_air  =0.55//0.225; //The speed at which the walking speed should incrase when not on a floor
Player_mov_incr_sprint_air=0.235//0.085; //The speed at which the deashing speed should incrase when not on a floor

Player_mov_dcr       =0.45; //The speed at which the walking speed should decrease to go back to 0 when on a floor
Player_mov_dcr_air   =0.25; //The speed at which the walking speed should decrease to go back to 0 when not on a floor
Player_mov_stop_check=1.5; //The speed will automatically go to 0 when the speed is in this range
Non_mov_dcr          =0.25; //The speed at which the non volountary movement should decrease

Sprint_spd           =6//2; //The dash speed
Sprint_boost         =5; //The initial boost given by a dash when not crouching
Sprint_boost_crouch  =7; //The initial boost given by a dash when crouching


//Speed cap variables
max_vert_speed       =10; //The maximum vertical speed (unless we're goundppounding)
max_horiz_speed      =6;  //The maximum normal horizontal speed
max_horiz_speed_slope=4;  //The maximum normal horizontal speed when climbing a slope
max_horiz_speed_groundp=1;//The maximum normal horizontal speed when groundpounding
max_horiz_speed_air  =3;  //The maximum normal horizontal speed while on the air

//If this is true, the player will crouch
crouch               =false;

//To detect if there's a ceiling near the top to prevent from not crouching
ceiling_s            =0;

//If this is true, the player will dash
sprint               =false;

//If the player can sprint
cansprint            =1;

//If the player can perform a sprint wallkick
canwallkick          =0;
inwallkick           =0;

wallkick_Vforce      =-8;
wallkick_Hforce      =-9;
new_nonMovDcrs       =0.2;

/*
These variables were used for a now cut mechanic where the player
could use 3 different sprint states (kinda like Drill Dozer)
*/

//Sprint level 0-slow 1-fast 2-final
sprint_level          = 0;

//Sprint meter
sprint_meter          = 0;    //Current amount
sprint_meter_max      = 100;  //Final amount
sprint_meter_increase = 2;    //How much to increase

sprint_release_boost  = 6;

//Ground pound variables
groundP               =false; //If this is true, the player will groundpound
groundP_delay         =20; //How many frames to waiit before you can groundpound
groundP_timer         =-1; groundP_timer2=-1; //Times to start falling and to stop rolling
groundP_special       = 0;
groundP_addforce      = 2.62;
groundP_inputcheck    = 0; //This is to check for a double down press

//Facing direction
Dir                   =-1;

//The offest of the landing effects
smokeoffset           =0;

//To fix the width and height variables
//scale_tolerance      =35;


//Start some cycles
alarm[0]=room_speed/10;
alarm[4]=10;


//Light control

//Draw variables

//Width and height
Xscale               =1;
Yscale               =1;

//Target width and height
Xscale_F             =1;
Yscale_F             =1;

//Sprite anglw
Angle                =0;


//Input variables
Stickdown            =0;

//Special move variables
dashjump_wait        =0;


//NPC information
/*
**   Change these to change how the player dialogue boxes work,
**   more information can be found in obj_par_speaker
**
*/


sprint_rest=0;

scale_tolerance=35;

/* */
with (obj_playerparent) {

}
///Initialize sprites
//This is just a lot of arrays to set the sprites for the multiple costumes, the number in the array is the costume selected

SkinImage               = 0;
IdleSprite              = spr_player_idle;
Idleclock               = 0;
Idleclock_max           = 60*8;
IdlePos                 = -1;
Spritemask              = spr_player_idle;


//Costume 1---Rocket Boy
Sprite_idle[0]          = spr_player_idle;

Sprite_idle2[0,0]         = spr_player_idle;
Sprite_idle2[0,1]         = spr_player_idle;
Sprite_idle2[0,2]         = spr_player_idle;
IdleImage[0]              = 23;
imagestop[0]              = 4;

Sprite_pull[0]          = spr_player_idle;
Sprite_jump[0]          = spr_player_jump;
Sprite_sprint[0]        = spr_player_idle;
Sprite_fall[0]          = spr_player_jump;
Sprite_walk[0]          = spr_player_idle;
Sprite_roll[0]          = spr_player_idle;
Sprite_crouch_idle[0]   = spr_player_idle;
Sprite_crouch_walk[0]   = spr_player_idle;
Sprite_crouch_sprint[0] = spr_player_idle;
Sprite_death[0]         = spr_player_idle;

/*  */
