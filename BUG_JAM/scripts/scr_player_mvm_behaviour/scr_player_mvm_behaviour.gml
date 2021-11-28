// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_mvm_behaviour(){

#region Passive logic

if(HP < HP_max){

   if(update_time/room_speed%1==0 ){
	  HP += global.upgrade[? "HealthReg_add"]*global.upgrade[? "HealthReg"];
	  if(HP>HP_max){HP = HP_max;}
   }

}

if(Spark_lv < 1){

   //Spark recharge formula
   Spark_lv += 
	( 
	  (1/room_speed) + 
	  (global.upgrade[? "Spark_timeincrease"] / (global.upgrade[? "Spark_timeincrease"]*100) *global.upgrade[? "ChargeSpd"] ) 
	)  
	/global.upgrade[? "Spark_time"]
	
}else{ Spark_lv = 1; }

#endregion

}