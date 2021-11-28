// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_take_damage(attack){
           
		  
		 attack = attack/ (1+ 0.25*global.upgrade[? "Resistance"]); 
		  
		 HP -= round(attack);
		 if(HP<0){
		    HP = 0;	 
		 }
		 return HP;
		 
}