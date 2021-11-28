

noclip = false;
//Collision checks
SOLIDL               =0; //Left collision check
SOLIDR               =0; //Right collision check
SOLIDL_V             =0; //Left collision check that also accounts for the player's speed
SOLIDR_V             =0; //Right collision check that also accounts for the player's speed

//Slope collision check
Slopesensor          =0;


Dir         = 1;
movespeed   = 0;
unvol_speed = 0;
fric_       = 1;
grav        = 0.7;
max_vsp     = 10;
stop = 1;
bounce      = 1.005;

depth=4;