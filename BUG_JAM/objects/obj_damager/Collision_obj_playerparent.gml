/// @description Insert description here
// You can write your code in this editor

var _atk = attack;

if(can_damage){
   
   with(other){
	    scr_take_damage(_atk);   
   }
   can_damage = false;
   alarm[0] = atk_interval;
   
}