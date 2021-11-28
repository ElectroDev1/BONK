/// @description Insert description here
// You can write your code in this editor

scr_play_music("mission_select.ogg",1,1,0.25)

bktglitch_init()

randomize();
var l = irandom(4);

Page = 0;



menusurf = -4
thanksurf = -4;
missionsurf = -4;
controlsurf = -4;

menuX=0;menuY=0;

if(global.won){ Page =-1 menuX=room_width; scr_play_music("credits.ogg",1,1,0.5) }
backX=0;backY=0;

time = 0;
_sin = 0;

Grade[0] = "A+";
Grade[1] = "A";
Grade[2] = "B";
Grade[3] = "C";
Grade[4] = "D";
Grade[5] = "E";
Grade[6] = "F";
Grade[7] = "-";

maxmission = obj_persistent.levels;
missionpos = 0;
mission_X = 0;


mission_icon[0] = spr_levelicon_test;
mission_name[0] = "Testing room";
mission_room[0] = rm_testroom;