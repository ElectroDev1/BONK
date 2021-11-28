/// @description Insert description here
// You can write your code in this editor
depth=-4;

topYoffset=0;topXoffset=0;
bottomYoffset = 0;
subwavepos = 0;
timepos = 0;
//Money
starting_money     = 0;

total_money        = 0;
total_missed_money = 0;
total_grade        = 0;

wave_money         = 0;
wave_missed_money  = 0;
wave_grade         = 0;

spendable_money    = 0;

prev_total_money   = 0;
prev_total_missed_money  = 0;
prev_spendable_money=0;
prev_total_grade   = 0;

prev_total_guys    = 0;
prev_robots        = 0;

prev_wave_grade    = 0;


escape_time = 0;

//Grade map
Grade[0] = "A+";
Grade[1] = "A";
Grade[2] = "B";
Grade[3] = "C";
Grade[4] = "D";
Grade[5] = "E";
Grade[6] = "F";
Grade[7] = "F";

UI_money = 0;

saved_upgrades = ds_map_create();

//HUD surfaces
mvm_game_surface = -4;
instance_create_depth(x,y,depth-1,obj_player_hud);


mvm_level = -1;
mvm_wave = -1;
mvm_wavecount = 1;
mvm_subwave = 0;


enum MVMSTATE {
     setup,
	 attack,
	 lose,
	 win,
	 over
}

mvm_state = MVMSTATE.setup;

mvm_wavemap = -4;
mvm_wave_robotlist = array_create(ROBOT_TYPES,0);//Clean the array
mvm_prev_robotlist = array_create(ROBOT_TYPES,0);

loaded = -1;


//This is a map that contains every single mvm level
MVM_WAVES = ds_map_create();

#region Create a default waves map

//This is the map that contains all the waves, so a level
wave = ds_map_create();

//Assing this level to the main map
MVM_WAVES[? "testwave"] = wave;

//Assing main wave properties
/*
1 - Credits given at the start
*/
wave[? "properties"] = [1000];

//Wave list - every entry in the list is a subwave
mvm_wavemap = ds_list_create();

//Assing this wave to the level map
wave[? 0] = mvm_wavemap;

/*
Every wave is composed of "sub waves", where a certain amount of robots will spawn at a specific time
Every sub wave is a ds map where we set up the wave properties and all the various spawners
*/


//Creating a sub wave

mvm_wavemap[| 0]=ds_map_create();     //Create the subwave ds map
var _subwave1 = mvm_wavemap[| 0];        //Reference the map

//Sub wave properties
/*
Array slots:
1 - subwave money (will be used to distribute the money amongst all non support robots) [real]
2 - if the game should wait for no robots to exist before starting [bool], won't affect first subwave of course
3 - should this subwave spawn a bomb (it will be given to the first robot of the first subwave slot, and not create
    it if a bomb already exists)
*/
_subwave1[? "properties"] = [600, 1, 1];

//These are "spawners", they tell which robots to create and other informations
/*
Array slots:
1 - robot type, use the enum "Robot"
2 - amount of robots [real]
3 - time since the start of the wave [real]
4 - spawn, this is used for multiple spawn locations, using obj_robot_spawner's spawnid variable [real]
*/

_subwave1[? "0"]          = [Robot.standard,2,20*room_speed,0];
_subwave1[? "1"]          = [Robot.standard,3,40*room_speed,0];
_subwave1[? "2"]          = [Robot.standard,3,70*room_speed,1];
_subwave1[? "3"]          = [Robot.standard,2,60*room_speed,0];



mvm_wavemap = ds_list_create();

wave[? 1] = mvm_wavemap;

mvm_wavemap[| 0]=ds_map_create();     //Create the subwave ds map
var _subwave1 = mvm_wavemap[| 0];        //Reference the map

_subwave1[? "properties"] = [800, 1, 1];

_subwave1[? "0"]          = [Robot.mini,5,21*room_speed,1];
_subwave1[? "1"]          = [Robot.standard,2,31*room_speed,0];
_subwave1[? "2"]          = [Robot.mini,5,51*room_speed,0];
_subwave1[? "3"]          = [Robot.standard,5,70*room_speed,0];



mvm_wavemap = ds_list_create();
wave[? 2] = mvm_wavemap;

mvm_wavemap[| 0]=ds_map_create();     //Create the subwave ds map
var _subwave1 = mvm_wavemap[| 0];        //Reference the map

_subwave1[? "properties"] = [1000, 1, 1];

_subwave1[? "0"]          = [Robot.standard,2,21*room_speed,0];
_subwave1[? "1"]          = [Robot.sniper,1,25*room_speed,2];
_subwave1[? "2"]          = [Robot.mini,5,52*room_speed,0];
_subwave1[? "3"]          = [Robot.standard,2,50*room_speed,0];



mvm_wavemap = ds_list_create();
wave[? 3] = mvm_wavemap;

mvm_wavemap[| 0]=ds_map_create();     //Create the subwave ds map
var _subwave1 = mvm_wavemap[| 0];        //Reference the map

_subwave1[? "properties"] = [1400, 1, 1];

_subwave1[? "1"]          = [Robot.sniper,1,21*room_speed,2];
_subwave1[? "0"]          = [Robot.standard,3,24*room_speed,0];
_subwave1[? "2"]          = [Robot.mini,4,24*room_speed,0];
_subwave1[? "3"]          = [Robot.mini,4,44*room_speed,2];
_subwave1[? "4"]          = [Robot.standard,3,64*room_speed,2];
_subwave1[? "5"]          = [Robot.sniper,1,61*room_speed,1];


mvm_wavemap = ds_list_create();
wave[? 4] = mvm_wavemap;

mvm_wavemap[| 0]=ds_map_create();     //Create the subwave ds map
var _subwave1 = mvm_wavemap[| 0];        //Reference the map

_subwave1[? "properties"] = [250, 1, 1];



_subwave1[? "0"]          = [Robot.giant,1,10*room_speed,0];
_subwave1[? "1"]          = [Robot.sniper,1,32*room_speed,2];
_subwave1[? "2"]          = [Robot.sniper,1,42*room_speed,3];
_subwave1[? "3"]          = [Robot.sniper,1,65*room_speed,0];


#endregion

_divided_money = 0;
_leftover   = 0;
_total_guys = 0;
wave_final_money = 0;
level_final_money = 0;

robots = 1;
_total_guys=1;

upg[0] = global.upgrade[? "WalkSpeed"]
upg[1] = global.upgrade[? "JumpHeight"]
upg[2] = global.upgrade[? "Resistance"] 
upg[3]=global.upgrade[? "HealthReg"]

upg[4]=global.upgrade[? "ChargeSpd"]
upg[5]=global.upgrade[? "Spread"] 
upg[6]=global.upgrade[? "Slowdown"]

upg[7]=global.upgrade[? "MeleeSpeed"] 
upg[8]=global.upgrade[? "MeleeRange"] 
upg[9]=global.upgrade[? "Knockback"] 
upg[10]=global.upgrade[? "MoneyMagnet"] 

upg[11]=global.upgrade[? "HomeReturn"] ;
upg[12]=global.upgrade[? "Explosion"] 
upg[13]=global.upgrade[? "Invincible"]


upg[14]=global.upgrade[? "HealthReg_add"]

upg[15]=global.upgrade[? "Spark_time"] 
upg[16]=global.upgrade[? "Spark_timeincrease"] 
upg[17]=global.canteen_amount 
upg[18]= global.canteen
 
 
#region Functions

return_to_wavestart = function(){
	
	show_debug_message("RETURNING TO WAVE START")
	
	instance_destroy(obj_coin);
	instance_destroy(obj_robot_parent);
	instance_destroy(obj_playerparent);
	
	with(obj_spawn){instance_create_depth(x,y,depth,obj_playerparent);}
	
	wave_money         = 0;
    wave_missed_money  = 0;
    wave_grade         = 0;
	
	total_grade = prev_total_grade;
   total_money = prev_total_money;
   total_missed_money = prev_total_missed_money;
   spendable_money = prev_spendable_money;
   
   _total_guys = prev_total_guys;
   robots = prev_robots;
   
   
     //Get total wave money
   level_final_money=0;
    var _mainlist    = MVM_WAVES[? mvm_level]; //Access the level
	
	show_debug_message("Calculating level's total money");
	show_debug_message(" ");
	
	for(var a=0; a<mvm_wavecount; a++){
		
	   var _wavemap     = _mainlist[? a]; 
	   show_debug_message("Accessing wave "+string(a));
	   
	   for(var i=0; i<ds_list_size(_wavemap); i++){
		   
		   show_debug_message("Accessing subwave "+string(i));
		   show_debug_message(" ");
	       var SB           = _wavemap[| i];
		   var _money       = SB[? "properties"][0];
		   
		   level_final_money+=_money;
	   }

	}
	show_debug_message("Found "+string(level_final_money)+" money");
	show_debug_message("");
	
	
	
	
	/*wave_final_money = 0;
	var _wavemap     = _mainlist[? mvm_wave]; 
	   
	   for(var i=0; i<ds_list_size(_wavemap); i++){
	       var SB           = _wavemap[| i];
		   var _money       = SB[? "properties"][0];
		   
		   wave_final_money+=_money;
	   }*/
	   
	   for(var e=0; e<array_length(mvm_wave_robotlist); e++){
   mvm_wave_robotlist[e] = mvm_prev_robotlist[e];
   }
   
   get_wave_stats(mvm_level,mvm_wave);
   
   
global.upgrade[? "WalkSpeed"] = upg[0]
 global.upgrade[? "JumpHeight"] = upg[1]
global.upgrade[? "Resistance"] = upg[2]
global.upgrade[? "HealthReg"] = upg[3]

global.upgrade[? "ChargeSpd"] = upg[4]
global.upgrade[? "Spread"] = upg[5]
global.upgrade[? "Slowdown"] = upg[6]

global.upgrade[? "MeleeSpeed"] = upg[7]
global.upgrade[? "MeleeRange"] =upg[8]
global.upgrade[? "Knockback"] = upg[9]
global.upgrade[? "MoneyMagnet"] = upg[10]

global.upgrade[? "HomeReturn"] = upg[11]
global.upgrade[? "Explosion"] = upg[12]
global.upgrade[? "Invincible"] = upg[13]

global.upgrade[? "HealthReg_add"] = upg[14]

global.upgrade[? "Spark_time"] = upg[15]
global.upgrade[? "Spark_timeincrease"] = upg[6]
global.canteen_amount  = upg[17]
 global.canteen = upg[18]
   
   
   mvm_state=MVMSTATE.setup;
   mvm_subwave = 0;
   subwavepos = 0;
   countdown = 120;
}

end_wave = function(){
	
	with(obj_usb){instance_destroy();}
	
   	prev_total_money = total_money;
	prev_total_missed_money = total_missed_money;
	prev_spendable_money = spendable_money;
	prev_wave_grade = wave_grade;
	prev_total_grade = total_grade;
	wave_money         = 0;
    wave_missed_money  = 0;
    wave_grade         = 7;
	
	for(var e=0; e<array_length(mvm_wave_robotlist); e++){
   mvm_prev_robotlist[e] = mvm_wave_robotlist[e];
   }
   
   
	
	upg[0] = global.upgrade[? "WalkSpeed"]
upg[1] = global.upgrade[? "JumpHeight"]
upg[2] = global.upgrade[? "Resistance"] 
upg[3]=global.upgrade[? "HealthReg"]

upg[4]=global.upgrade[? "ChargeSpd"]
upg[5]=global.upgrade[? "Spread"] 
upg[6]=global.upgrade[? "Slowdown"]

upg[7]=global.upgrade[? "MeleeSpeed"] 
upg[8]=global.upgrade[? "MeleeRange"] 
upg[9]=global.upgrade[? "Knockback"] 
upg[10]=global.upgrade[? "MoneyMagnet"] 

upg[11]=global.upgrade[? "HomeReturn"] ;
upg[12]=global.upgrade[? "Explosion"] 
upg[13]=global.upgrade[? "Invincible"]


upg[14]=global.upgrade[? "HealthReg_add"]

upg[15]=global.upgrade[? "Spark_time"] 
upg[16]=global.upgrade[? "Spark_timeincrease"] 
upg[17]=global.canteen_amount 
upg[18]= global.canteen
	
	mvm_wave++;
    mvm_state = MVMSTATE.setup;
    timepos=0;
	subwavepos = 0;
	countdown = 120;
	
	get_wave_stats(mvm_level,mvm_wave);
	
	var _mainlist    = MVM_WAVES[? mvm_level]; //Access the level
	var _wavemap     = _mainlist[? mvm_wave]; 
	   
	   for(var i=0; i<ds_list_size(_wavemap); i++){
	       var SB           = _wavemap[| i];
		   var _money       = SB[? "properties"][0];
		   
		   wave_final_money+=_money;
	   }

  
}

//This creates an array to tell the player what to expect from the wave
/*
waveid  - the id of the wave in the main wave map [any]
subwave - if this is set to 0 or higher, it'll check for a specific spawner instead of the entire wave [real]
          (this is used during waves)
*/
get_wave_stats = function(waveid = "testwave", wave = 0, subwave = -1){
    
	show_debug_message("--------GETTING WAVE STATS--------");
	show_debug_message(" ");
	
	loaded=-1;
	mvm_wave_robotlist = array_create(ROBOT_TYPES,0);//Clean the array
	

	var _mainlist    = MVM_WAVES[? waveid]; //Access the level
	var _wavemap     = _mainlist[? wave]; //Access the 
	
	show_debug_message("Checking level '"+string(waveid)+"'...")
	show_debug_message(" ");
	
	if(subwave<0){
		
		show_debug_message("Checking wave "+string(wave)+"...")
		
	   var _W = _wavemap;	
	   var _subwave_amount = ds_list_size(_W);
	   show_debug_message("Found "+string(_subwave_amount)+ " subwaves")
	   
	   
	   //Go through the level list and check every sub wave
	   for(var a=0; a<_subwave_amount; a++){
		   
		   var _sw  =   _W[| a];
		   
		  
		    var _sw_w = ds_map_size(_sw)-1;
		    show_debug_message("Accessing subwave "+string(a)+" of size "+string(_sw_w));
		   
		   
		   //Go through all the sub waves and add each type to the array
		   for(var i=0; i<_sw_w; i++){
		      
		      var _type = 	_sw[? string(i)][0]; //Get the robot type
		      var _numb =   _sw[? string(i)][1]; //Get the amount
			  var _time =   _sw[? string(i)][2]; 
			  
			  show_debug_message(
			  "Found "+string(_numb)+" of type "+string(_type)+" in pos "+string(i)+" at timepos "+string(_time)
			  )
			  
		      //Add to the list
		      if(array_length(mvm_wave_robotlist)<_type){
			     mvm_wave_robotlist[_type] = _numb;
		      }
		      else{
			     mvm_wave_robotlist[_type] += _numb;   
		      }
			  
			  
			  
		   }
		   show_debug_message("-----");
			  
	   }
	   loaded=1;
	   
	}
	else{
		
		show_debug_message("Checking subwave "+string(subwave)+ " of wave "+string(wave)+"...")
		
	   var _Tsubwave     = _wavemap[| subwave]; //Access the subwave	
	   var _subwave_length = ds_map_size(_Tsubwave)-1;
	   
	   //Go through the subwave
	   for(var a=0; a<_subwave_length; a++){
		   
		   var _type = _Tsubwave[? string(a)][0]; //Get the robot type
		   var _numb = _Tsubwave[? string(a)][1]; //Get the amount
		   var _time = _Tsubwave[? string(a)][2];
		   
		   show_debug_message(
			  "Found "+string(_numb)+" of type "+string(_type)+" in pos "+string(a)+" at timepos "+string(_time)
		   )
		   
		   if(array_length(mvm_wave_robotlist)<_type){
			     mvm_wave_robotlist[_type] = _numb;
		   }
		      else{
			     mvm_wave_robotlist[_type] += _numb;   
		   }
		   
	   }
	
	}

    show_debug_message(" ");
	show_debug_message("Preview list :"+string(mvm_wave_robotlist));

	show_debug_message(" ");
	
}

mvm_start = function(levelname = "testwave"){
	
   mvm_level = -1;	
   mvm_wave = -1;
	
   show_debug_message(" ")
   show_debug_message("------LOADING LEVEL '"+levelname+"'------")

   var _wave = MVM_WAVES[? levelname];
   
   starting_money = _wave[? "properties"][0];
   show_debug_message("Assigned "+string(starting_money)+" credits");	
   show_debug_message(" ")
	
   total_money = starting_money;
   spendable_money = total_money;
   UI_money = 0;
   
   
   	prev_total_money = total_money;
	prev_total_missed_money = total_missed_money;
	prev_spendable_money = spendable_money;
   
   get_wave_stats(levelname,0);
   
   
   mvm_level = levelname;
   mvm_wave  = 0;
   mvm_wavecount = ds_map_size(MVM_WAVES[? mvm_level])-1;
   mvm_subwave = 0;
   wave_grade = 6;
   
   countdown = 120;

   for(var e=0; e<array_length(mvm_wave_robotlist); e++){
   mvm_prev_robotlist[e] = mvm_wave_robotlist[e];
   }


   //Get total wave money
   level_final_money=0;
    var _mainlist    = MVM_WAVES[? levelname]; //Access the level
	
	show_debug_message("Calculating level's total money");
	show_debug_message(" ");
	
	for(var a=0; a<mvm_wavecount; a++){
		
	   var _wavemap     = _mainlist[? a]; 
	   show_debug_message("Accessing wave "+string(a));
	   
	   for(var i=0; i<ds_list_size(_wavemap); i++){
		   
		   show_debug_message("Accessing subwave "+string(i));
		   show_debug_message(" ");
	       var SB           = _wavemap[| i];
		   var _money       = SB[? "properties"][0];
		   
		   level_final_money+=_money;
	   }

	}
	show_debug_message("Found "+string(level_final_money)+" money");
	show_debug_message("");
	
	wave_final_money = 0;
	var _wavemap     = _mainlist[? 0]; 
	   
	   for(var i=0; i<ds_list_size(_wavemap); i++){
	       var SB           = _wavemap[| i];
		   var _money       = SB[? "properties"][0];
		   
		   wave_final_money+=_money;
	   }
   
   show_debug_message("Finished loading level!");
   	show_debug_message("-----SCRIPT END-----");
   show_debug_message(" ");

}

subwave_money = 0;

start_subwave = function(_subwave=0){
    
   show_debug_message(" ");
   show_debug_message("---STARTING SUBWAVE "+string(_subwave)+"---");
 
  subwave_money = 0;
   var _mainlist    = MVM_WAVES[? mvm_level]; //Access the level
	var _wavemap     = _mainlist[? mvm_wave]; 
	var SB           = _wavemap[| _subwave];
	
	subwave_money = SB[? "properties"][0];
	  
   var _mone        = SB[? "properties"][0];
   
   show_debug_message(" ");
   show_debug_message("Total subwave money: "+string(_mone));
   show_debug_message(" ");
   
   _divided_money = 0;
   _leftover   = 0;
   _total_guys = 0;
   for(var a=0; a<array_length(mvm_wave_robotlist); a++){
	   _total_guys+=mvm_wave_robotlist[a];	 
	   prev_total_guys+=mvm_wave_robotlist[a];
   }
			 
	robots = _total_guys;
	prev_robots = robots;
   _divided_money = ceil( _mone/_total_guys );
   _leftover = _mone - _divided_money*_total_guys;	
   ;
	
	prev_wave_grade = wave_grade;
	prev_total_grade = total_grade;
	wave_money         = 0;
    wave_missed_money  = 0;
    wave_grade         = 0;
   
   
   show_debug_message("Total robots: "+string(_total_guys));
   show_debug_message("Money given: "+string(_divided_money));
   show_debug_message("Leftover of: "+string(_leftover));
   show_debug_message(" ");
   show_debug_message("---END SCRIPT---");
   show_debug_message(" ");
	
}

#endregion

//Start
alarm[0] = 1;

background_map = ds_map_create();
background_map[? layer_get_id("Background")] = 0.4;
background_map[? layer_get_id("Clouds")] = 0.2;
background_map[? layer_get_id("Clouds_1")] = 0.2;

BKGoffset[2] = 0;