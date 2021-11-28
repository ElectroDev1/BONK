/// @description scr_player_behaviour();
function scr_player_behaviour() {


#region Update state
	

	//If we're not groundpounding
	if(state!=Playerstate.groundpound){


       if(state!=Playerstate.attack){
		   
		 

	   if(Vsp_final==0) || (onfloor){//If we're not moving vertically

	      var _cansprint = 0;
	      if(scr_input_check(input.action1)) && (Control)&&(_cansprint){//Sprint state
 
	         if(_cansprint){state = Playerstate.sprint;}

	      }else{//If we aren't sprinting 
   
	           
	         if(onfloor){//On floor states    
				 
        
	            if(inwallkick){ Sprint_movement=0; inwallkick=0;} 
				
                //Moving and idle
	            if(Player_movement!=0){           
	               state = Playerstate.move;               
	            }else{           
	               state = Playerstate.idle;            
	            }     
				
      
	            //Step sound logic
	            if(hspeed!=0)&&(Movement!=0){ 
      
	               if(step_offset<18-(hspeed*Dir)){ step_offset++;                           }
				   else{                         step_offset=0; }
                
	            } 
      
	            if(Movement==0){step_offset=0;}
				
      
	         }
   
	       }
           
	   }
	   else{//Moving vertically

	      if(Vsp<0 || Vsp_super<0){//If we're moving up
   
	         state = Playerstate.jump; 
         
	      }else if( (Vsp>0||Vsp_super<0) && !collision_rectangle(bbox_left,bbox_bottom-4,bbox_right,bbox_bottom+16,obj_slopeparent,true,false) ){//Moving down
         
	         state = Playerstate.fall; Xscale_F=0.9; Yscale_F=1.1; 
    
	      }
   
	   }
	   
	   
	     
          if(mouse_check_button_pressed(mb_left)&&(Control)){
	        state = Playerstate.attack;
	        image_index = 0;
			
			
			
          }

	   
	   }else{
		
		  if(image_index>=5)&&(image_index<6)&&(!instance_exists(obj_supermelee)){
			
			 with(instance_create_depth(x,y,depth-2,obj_supermelee)){
			     
				 //if(global.upgrade[? "MeleeRange"]<=0){visible=false;}
				 
				 image_speed  = 0.6 + (0.05) * global.upgrade[? "MeleeSpeed"];
				 image_xscale = (0.7 + 0.1*global.upgrade[? "MeleeRange"])*-other.Dir;
				 
				 xoffset = (4*global.upgrade[? "MeleeRange"])*-other.Dir;
				 image_yscale = abs(image_xscale);
				 
				 var _D = other.Dir;
				 
				 with(collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_robot_parent,0,0)){
				      event_user(4);	 
					 unvol_speed =  _D*( (4-knockback_resistance)  *(global.upgrade[? "Knockback"])  )*knock_res; 
					  vspeed = (-2*global.upgrade[? "Knockback"])
					  y-=2*bool(global.upgrade[? "Knockback"]);
				 }
				 
			}
			
		  }
		   
	   }

	}


#endregion


#region Horizontal movement logic

	//Get movement variable
	Movement = (-scr_input_check(input.left)+(scr_input_check(input.right)) )*Control;

	//Cap movement
	if(Player_movement<-7){Player_movement=-7;}
	if(Player_movement>7){Player_movement=7;}

	//Stick movement
	if(Control){ 
	   if(scr_gamepad_check_axis(gp_axislh)>0.5) Movement=1;
	   if(scr_gamepad_check_axis(gp_axislh)<-0.5) Movement=-1;
	}



	var SIGN=sign(Movement);

	//Add to the movement speed based on the direction
	if(SIGN!=0){
   
	   //Set direction
	      Dir=SIGN;

	   //Increase speed
   
	   //Moving vertically
	   if(Vsp_final!=0){
   
	      if(SIGN==1){ if(Player_movement<max_horiz_speed_air-crouch*2){ var OK=1; }else{ var OK=0; }      }
	      else{ if(Player_movement>-max_horiz_speed_air+crouch*2){ var OK=1; }else{ var OK=0; } }
   
	      if(OK){
      
	         if(state!=Playerstate.sprint){//We're not sprinting
         
	            Player_movement+=Player_mov_incr_air*SIGN;
         
	         }else{
         
	            Player_movement+=Player_mov_incr_sprint_air*SIGN;
         
	         }
         
	      }
   
	   }else{
   
	      if(SIGN==1){ if(Player_movement<max_horiz_speed-crouch*2){ var OK=1; }else{ var OK=0; } }
	      else{ if(Player_movement>-max_horiz_speed+crouch*2){ var OK=1; }else{ var OK=0; } }
   
	      if(OK){
      
	         if(state!=Playerstate.sprint){//We're not sprinting
         
	            Player_movement+=Player_mov_incr*SIGN;
         
	         }else{
         
	            Player_movement+=Player_mov_incr_sprint*SIGN;
         
	         }
      
	      }
   
	   }
   
   
	   //Don't make the player slide too much
	   if(SIGN==1){ 
   
	      if(Player_movement<-2){Player_movement=-1}
   
	   }else{
   
	      if(Player_movement>2){Player_movement=1}
   
	   }
   
	}

	//Not moving
	else{

	   //Get the hspeed to 0
	   if(onfloor){
   
	      Player_movement=scr_approach(Player_movement,0,Player_mov_dcr);
     
	   }
	   else{
   
	      Player_movement=scr_approach(Player_movement,0,Player_mov_dcr_air);
   
	   }
   
   
	   //This just makes sure it gets to 0
	   if(Player_movement<Player_mov_stop_check)&&(Player_movement>-Player_mov_stop_check){ 
   
	      if(!roll){Player_movement=0;}
      
	   }
    
	}

    //Safestop
	if((SOLIDR_V)||(SOLIDR))&&(Player_movement>0){Player_movement=0;}
	if((SOLIDL_V)||(SOLIDL))&&(Player_movement<0){Player_movement=0;}
	
#endregion


	//Check if not touching a wall below, then if the player is not sprinting, set gravity
	if(!onfloor)&&(state!=Playerstate.sprint)&&(groundP==false){ 

	   grav=weight*canmove;
	   superJump_level=0; 
	   superJump=0;
   
	}


	//Deal with non volountary movement
	//Get it to 0
	if(onfloor){Non_volountary_mov=scr_approach(Non_volountary_mov,0,Non_mov_dcr);}
   
	//This just makes sure it gets to 0
	if(Non_volountary_mov<3)&&(Non_volountary_mov>-3){Non_volountary_mov=0;}


#region Jump behaviour
	
	if(scr_input_check_pressed(input.action0))&&(Control){

	   //If the player can jump and the jump button is pressed
	      if(/*onfloor*/jumps>0){
         
	         if(!groundP){ scr_jump(); }
          
	      }
      
	}

	//Dinamic jump height logic
	if(state==Playerstate.jump){

	   if(scr_input_check_released(input.action0)){
   
	      Vsp=max(Vsp, -jumpforce/2);
      
	   }
   
	}

#endregion



#region Crouching behaviour


	//Small crouch squash

	//Crouchhing state logic
	if(!collision_rectangle(bbox_left+6,bbox_top-1,bbox_right-6,bbox_top-16,obj_solid,true,false)){
	   ceiling_s=0;
	}
	//Keep the crouched if locked
	if(ceiling_s){

	   if(state!=Playerstate.sprint){ crouch=true; }
	}
	else{

	   if(Control){//If you can control the player

	      if( scr_input_check(input.down) || (scr_gamepad_check_axis(gp_axislv)>0.5) ){//If the down key is held
	         crouch=true;
	      }
	      else if(!collision_rectangle(bbox_left+2,bbox_top-6,bbox_right-2,bbox_top-4,obj_solid,true,false)){
	         crouch=false;
	      }

	   }

	}
	
	
	
	//Autocrouch
	//var mov = (scr_input_check(input.right)-scr_input_check(input.left)) 
	//var most = sign(scr_gamepad_check_axis(gp_axislh))

	if(Dir==-1){ var ER=0; }else if(Dir==1){ var ER=1; }

	   if( (collision_rectangle(bbox_left-3,bbox_top,bbox_right+3,bbox_bottom,obj_solid,1,0)) )
	   &&(!collision_rectangle(bbox_left-12,bbox_bottom-16,bbox_right+12,bbox_bottom-12,obj_solid,1,0))
	   &&(  onfloor|| scr_input_check(input.action1) ){

	      if(ceiling_s==0){ x+=8*Dir; crouch=true; ceiling_s=1;}
	}


	//If crouching
	if(crouch==true){
   
	      if(collision_rectangle(bbox_left+1,bbox_bottom+2,bbox_right-1,bbox_bottom-1,obj_semisolid,1,0))
	      ||(collision_rectangle(bbox_left+1,bbox_bottom+2,bbox_right-1,bbox_bottom-1,obj_semisolid_moving,1,0))
	      ||(collision_rectangle(bbox_left+1,bbox_bottom+2,bbox_right-1,bbox_bottom-1,obj_slopeparent,1,0)){ 
      
	        //if(_Sjump){
				 //if(superJump_level<100){superJump_level+=superjump_incr;}else{superJump_level=100;}
			//}
         
	      }
   
	   if(superJump_level>90)&&(_Sjump){
	      if(superJump==0){ superJump=1; }
	   }

	}
	else{
	   if(superJump==1)&&(Vsp_super==0)&&(Vsp_final==0)&&(_Sjump){ Vsp_super = -jumpforce-superboost; grav=weight; superJump_level=0; superJump=0; state=Playerstate.jump; }
	}

	//Reset super jump value if moving too much or the jump is released
	if(  ((Player_movement<-1.2)||(Player_movement>1.2) )
	      || (
      
	          (scr_input_check_released(input.down) 
	          ||((scr_gamepad_check_axis(gp_axislv)<0.7)&&(Stickdown>0))
	          ||(scr_input_check(input.action1))  

	         )
	      )
	)
	&&(superJump_level!=0){ superJump_level=0; superJump=0; }


    //Increase stickdown variable
	if(scr_gamepad_check_axis(gp_axislv)>0.2){Stickdown+=0.1;}else{Stickdown=0;}


#endregion

#region Groundpound behaviour
	
  if(groundP){

	if(groundP==false){//Not groundpounding


	   //If not touching the ground
	   if(state==Playerstate.jump)||(state==Playerstate.fall){
   
	      //Down key is pressed
	      if( (scr_input_check_pressed(input.down))
	           ||((scr_gamepad_check_axis(gp_axislv)>0.2)&&(Stickdown<0.5)    ))
	            &&(!onfloor)      
	            &&(Control)
	            &&(!collision_rectangle(bbox_left,bbox_bottom-4,bbox_right,bbox_bottom+4,obj_semisolid_moving,0,0))
	            //And not touching a level box (for releasing from one)
	            &&(!collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_level_box,false,false)){

	               //scr_groundpound_start();

	     }
      
	   }
   
   
	}
	else{//groundpounding
 
	  crouch=false;
	  //Cancel the ground pound
	  if((scr_input_check_pressed(input.up))||(scr_gamepad_check_axis(gp_axislv)<-0.2))&&(Vsp_final>=0){
  
	     event_user(1);
     
	  }
  
	  //Manage the vertical speed and movement
	  if(Vsp_final<0){Vsp_final=0;}
	  if(Vsp_final==0){max_horiz_speed=0;}else{max_horiz_speed=max_horiz_speed_groundp;}
  


	   //Groundpound alarms
	   if(groundP_timer>0){
   
	         if(global.cutscene!=2){groundP_timer--;}
      
	   }
	   else if(groundP_timer!=-1)
	   {

	     if(!collision_rectangle(bbox_left,bbox_bottom-4,bbox_right,bbox_bottom+4,obj_semisolid_moving,0,0)
	     &&(!collision_rectangle(bbox_left,bbox_bottom-8,bbox_right,bbox_bottom+14,obj_semisolid,0,0))
	     &&(sprite_index==Sprite_roll[SkinImage])){
	         Vsp  = 18;
	         Xscale_F=0.7;
	         Yscale_F=1.3;
	         grav = weight;

	      }   
	      else{ event_user(1); }
            
	         groundP_timer=-1; 
   
	   }   

	   //Stop rolling
	   if(groundP_timer2>0){

	      if(global.cutscene!=2){groundP_timer2--;}
   
	   }
	   else if(groundP_timer2!=-1){

	        image_speed=0;
	        groundP_timer2=-1;
   
	   }
   
   
	}
	
	
  }
	
#endregion


	if(dashjump_wait>0){ dashjump_wait--; }


	//Calculate horizontal speed
	//if(global.cutscene==2){hspeed=0;}else{


	   hspeed = (( 
	     
	              ( Player_movement/2+Non_volountary_mov+(Sprint_movement*cansprint) )
				  *( 1 + (0.2*global.upgrade[? "WalkSpeed"]) )
				   
	             )*Hmove) *canmove;
   
	   //if(SOLIDR_V)&&(SOLIDR)&&(hspeed>=0){ hspeed=0; }
	   //if(SOLIDL_V)&&(SOLIDL)&&(hspeed>=0){ hspeed=0; }
	//}

    //Calculate final speeds
	Vsp_final=Vsp+Vsp_super+Vsp_carry;

	//Animate
	if(Animate==true){ scr_player_animation(); }

	
	/*if(global.cutscene==2){ vspeed=0;

	}
	else if(sprint==0){*/

	   y+=((Vsp_final)*canmove);

	//}

    //if(!_cansprint){sprint=false;}
	
	
if(HP<=0)&&(!instance_exists(obj_player_homereturn)){
   
   for(var a=0; a<6; a++){
	   randomize();
	   with(instance_create_depth(x+irandom_range(-32,32),y-32,depth+2,obj_effect_method)){
		    
			myvar=-1;
			if(x>=other.x){myvar=1;}
			vspeed=-irandom_range(4,10);
			gravity = 0.4;
			sprite_index = spr_gibs;
			image_index = irandom(image_number);
			image_speed = 0;
			my_method=function(){
			    image_angle-=8*myvar;
				hspeed = 2*myvar;
				
			}
			my_draw_method=function(){draw_self();}
			
	   }
   }
   
   with(instance_create_depth(x,y,depth-1,obj_player_homereturn)){visible=false; revive=1; spd=0.01; }	
   x = obj_spawn.x; y = obj_spawn.y;
   instance_deactivate_object(id);
   vspeed=0;
		
}
	
	//Spark behaviour
if(Spark_lv>=1)&&(Control){
	
   if(mouse_check_button_released(mb_right)){
	   
	   with(instance_create_depth(x+20*Dir,bbox_bottom-64+24,depth-1,obj_milk)){
		    movespeed = lengthdir_x(10,point_direction(other.x,other.y-sprite_yoffset/2,mouse_x,mouse_y));
			dir=1;
			vspeed = lengthdir_y(12,point_direction(other.x,other.y-sprite_yoffset/2,mouse_x,mouse_y));
	   }
	   
	   with(instance_create_depth(x+20*Dir,bbox_bottom-64+24,depth-2,obj_effect_method)){
		    sprite_index=spr_spark_start_effect;
		    my_draw_method=function(){draw_self();}
			
			my_method=function(){
			    if(image_index>=image_number-1){instance_destroy();}image_speed=0.75;	
			}
	   }
	 
	  Spark_lv=0;
	   
   }
	
}

if(global.canteen_amount>0){

   if(keyboard_check_pressed(ord("H"))&&(Control)){
	
	  switch(global.canteen){
		     case 0: instance_create_depth(x,y,depth-1,obj_player_homereturn);
			         instance_deactivate_object(id); global.upgrade[? "HomeReturn"]--;
					 obj_upgradestation.disk_spent+=10;
					 break; 
					
			 case 1: 
			 
			   with(instance_create_depth(x,bbox_bottom,depth+4,obj_effect_method)){
				    image_speed=0.5; sprite_index=spr_explodion;
					my_method=function(){
					   	if(image_index > image_number-1){ instance_destroy(); }
						
						if(image_index<2){
						with(obj_robot_parent){
						     if(place_meeting(x,y,other.id)){event_user(4);}	
						}
						}
					}
					my_draw_method=function(){draw_self();}
			   }
			 
			 global.upgrade[? "Explosion"]--;
			 obj_upgradestation.disk_spent+=75;
			 break;
			 
			 case 2:
			 
			   invincible=1; obj_upgradestation.disk_spent+=100;
			   with(instance_create_depth(x,y-32,depth-2,obj_effect_method)){
		
		   image_xscale=4;
		
		   my_draw_method=function(){
			
			   draw_set_colour(c_red); draw_set_alpha(image_alpha);
			   draw_circle(x,y,image_xscale,0);
			   draw_set_colour(c_white); draw_set_alpha(1);
			   
		   }
		   
		   my_method=function(){
			   
			   image_alpha-=0.04;
			   image_xscale+=1;
			   if(image_alpha<=0){instance_destroy();}
			
		   }
		
	  }
               alarm[9]=invincible_time;
			   
			   global.upgrade[? "Invincible"]--;
			 
			 break;
	  }
	  global.canteen_amount--;
	 
	
   }

}

var _healthpak = collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_healthkit,0,0);

if(_healthpak){
   if(_healthpak.visible){
	  if(HP<HP_max){
		 HP+=40;
		 if(HP>HP_max){HP=HP_max;}
		 with(_healthpak){alarm[0]=600;}
	     _healthpak.visible=false;
	  }
	  
	  
   }
}

}

