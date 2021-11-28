/// @description Insert description here
// You can write your code in this editor
if(!instance_exists(obj_playerparent)){
   
   exit;
   
}

if(x>=obj_playerparent.x){Dir=-1;}else{Dir=1;}

if(delay>25){
TX = lerp(TX,obj_playerparent.x,0.1);
TY = lerp(TY,obj_playerparent.y-32,0.1);
}

if(delay<=0){
	
	//Shoot
	vspeed=-2;
	y-=3;
	
	var _p = collision_line(x+16*Dir,bbox_bottom-76,TX,TY,obj_playerparent,1,0);
	
	if(_p){

	  
	  with(_p){
		  
		 if(!invincible){ 
		  
		   if(x>other.x){ Non_volountary_mov = 6; }  
		   else{ Non_volountary_mov = -6; } 
		   HP -= other.attack;
		   
		 }   
		   
	  }
   }
	
   delay=og_delay;	
 	
}