/// @description Initialize game variables
// You can write your code in this editor
global.debug = 0;
global.cutscene = 0;

fade = 0;
fade_alpha = 1.5;

#region Get global vars from setting file

  var _WS = 1; 

  if(file_exists("Settings.dat")){
	    
	 var _file = file_text_open_read("Settings.dat");
	 
	 _WS = real(file_text_read_string(_file));
	 
	 file_text_close(_file);
	
  }
  
alarm[2] = 1;

global.won = 0;

levels = 1;
  
  if(file_exists("Game.sav")){
	 global.datamap = ds_map_secure_load("Game.sav");  
  }else{
	 global.datamap = ds_map_create();
	 
	 //Level records
	 /* string = level index
	 1- has it been beaten
	 2- money record
	 3- grade
	 */
	 for(var a=0; a<levels; a++){
	     global.datamap[? "Money_"+string(a)] = 0; 	 
	     global.datamap[? "Grade_"+string(a)] = 7; 	 
	 }
  } 

#endregion

global.stream = -4;

var num = audio_get_listener_count();
for( var i = 0; i < num; i++;)
{
    var info = audio_get_listener_info(i);
    audio_set_master_gain(info[? "index"], 1);
    ds_map_destroy(info);
}

enum input{
     up,down,left,right,action0,action1,action2,start	
}

global.keyboard[input.up]=ord("W");global.keyboard[input.down]=ord("S");
global.keyboard[input.left]=ord("A");global.keyboard[input.right]=ord("D");
global.keyboard[input.action0]=vk_space;global.keyboard[input.action1]=ord("J");
global.keyboard[input.action2]=ord("K");global.keyboard[input.start]=vk_escape;

global.button[input.up]=gp_padu;global.button[input.down]=gp_padd;
global.button[input.left]=gp_padl;global.button[input.right]=gp_padr;
global.button[input.action0]=gp_face2;global.button[input.action1]=gp_face3;
global.button[input.action2]=gp_face1;global.button[input.start]=gp_start;


#macro WINDOW_W 960/2
#macro WINDOW_H 540/2
#macro RED  rgb_to_bgr($e43b44)
#macro GREEN rgb_to_bgr($63c74d)
#macro YELLOW rgb_to_bgr($fecf34)
#macro ROBOT_TYPES 6

global.Window_S = _WS;

global.max_jumps=1;

event_user(0);



//Create a list of robot types
enum Robot {
	 standard = 0,
	 giant = 1,
	 heavy = 2,
     mini = 3,
	 sniper = 4,
}
global.Xaxis = 1;global.Yaxis = 1;
global.ROBOTS[Robot.standard] = obj_robot_standard;
global.ROBOTS[Robot.mini] = obj_robot_tiny;
global.ROBOTS[Robot.sniper] = obj_robot_sniper;
global.ROBOTS[Robot.giant] = obj_robot_giant;

#region Set up upgrades

global.upgrade = ds_map_create();

global.upgrade[? "WalkSpeed"] = 0;
global.upgrade[? "JumpHeight"] = 0;
global.upgrade[? "Resistance"] = 0;
global.upgrade[? "HealthReg"] = 0;

global.upgrade[? "ChargeSpd"] = 0;
global.upgrade[? "Spread"] = 0;
global.upgrade[? "Slowdown"] = 0;

global.upgrade[? "MeleeSpeed"] = 0;
global.upgrade[? "MeleeRange"] = 0;
global.upgrade[? "Knockback"] = 0;
global.upgrade[? "MoneyMagnet"] = 0;

global.upgrade[? "HomeReturn"] = 0;
global.upgrade[? "Explosion"] = 0;
global.upgrade[? "Invincible"] = 0;


global.upgrade[? "HealthReg_add"] = 2;

global.upgrade[? "Spark_time"] = 20;
global.upgrade[? "Spark_timeincrease"] = 0.15;

global.canteen_amount = 0;
global.canteen = -1;

global.attackpower = 65;

#endregion
