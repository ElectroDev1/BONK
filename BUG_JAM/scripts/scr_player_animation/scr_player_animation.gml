/// @description scr_player_animation();
function scr_player_animation() {
	/*
	**
	**    Usage:
	**       scr_player_animation()
	**
	**    Purpose:
	**       Changes between the player's animations based on the movement and specific variables
	**
	**    Variables:
	**       SkinImage   = the current costume selected
	**
	*/
	//if(imagestop>=image_number){imagestop-=image_number;}
	
	var _cansprint,_Sjump,_Gpound = 1;
		

	//if(global.cutscene!=2){

	   if(state!=Playerstate.groundpound){//If not groundpounding
   
        if(state!=Playerstate.attack){
   
	      if(!onfloor){//Moving vertically
   
	            if(state==Playerstate.jump){//Jump state
            
            
	               Idleclock=0; IdlePos=-1;//Reset idle cycle
               
	               if(hspeed>6)||(hspeed<-6){//Roll when going fast
               
	                  sprite_index = Sprite_roll[SkinImage]; image_speed=0.5;
                  
	               }
	               else{
               
	                  //Set jump sprite
	                  if(crouch){sprite_index=Sprite_crouch_idle[SkinImage];}else{sprite_index = Sprite_jump[SkinImage];}
	                  if(image_index>=image_number-1){image_speed=0; image_index=image_number;}else{image_speed=0.25;}
                  
	               }
               
               
	            }                 
	            else if(state==Playerstate.fall){//Fall state
            
      
	                    Idleclock=0; IdlePos=-1; //Reset idle cycle
      
	                    if(sprite_index!=Sprite_roll[SkinImage]){//If not rolling, otherwise the rolling sprite will keep going
         
	                       if(crouch){ sprite_index=Sprite_crouch_idle[SkinImage]; }
	                       else{ 
         
                          
	                          if(!roll){ if(image_index==0){ image_speed=0.05;  }else{ image_index=1; image_speed=0; } sprite_index=Sprite_fall[SkinImage]; }
	                          else{ image_speed=0.5; sprite_index=Sprite_roll[SkinImage]; }
            
	                       }
         
	                    }
	                    else{ sprite_index=Sprite_roll[SkinImage]; }
                    
                    
	            }   
	            else if(state==Playerstate.sprint)&&(_cansprint){//Sprint state
            
        
	                    Idleclock=0; IdlePos=-1;//Reset idle cycle
      
	                    if(crouch){ sprite_index=Sprite_crouch_sprint[SkinImage]; }
	                    else{ sprite_index=Sprite_sprint[SkinImage]; }
         
	                    if(hspeed>7)||(hspeed<-7){image_speed=1;}else{image_speed=0.5;}//Change speed based on how fast we are
      
                    
	            }
          
            
	     }
	     else{//We're on a floor
      
	         if(state==Playerstate.idle){//Idle state
         
      
	            if(crouch){ sprite_index=Sprite_crouch_idle[SkinImage]; IdlePos=0; Idleclock=0; } //Crouch idle
	            else {
         
	               if((scr_input_check(input.right))||(scr_input_check(input.left))||(scr_gamepad_check_axis(gp_axislh)>0.5)||(scr_gamepad_check_axis(gp_axislh)<-0.5))//Pull
	               &&( (SOLIDL)||(SOLIDR)||(SOLIDR_V)||(SOLIDL_V) )&&(Control){
                                
	                 if(!crouch){ sprite_index=Sprite_pull[SkinImage]; image_speed=0.25  Idleclock=0; }
               
	               }else{//Full idle               
                
	                  //Stop walk logic
	                  if(!collision_rectangle(bbox_left,bbox_bottom-4,bbox_right,bbox_bottom+2,obj_semisolid_moving,1,0)){
               
	                     if(sprite_index==Sprite_walk[SkinImage]){
                  
	                        if(image_index>imagestop[SkinImage])||(image_index<imagestop[SkinImage]-4){
                     
	                           scr_player_idle();
                     
	                        }
	                        else{  if(image_index==imagestop[SkinImage]){scr_player_idle();}  }
                                    
	                     }
	                     else{ scr_player_idle(); }
               
	                  }
	                  else{ scr_player_idle(); }
                          
	               }
           
	             }  
           
             
	          }
	          else if(state==Playerstate.move){//Move state
      
	                  Idleclock=0; IdlePos=-1;//Reset idle cycle
                  
	                  if( ((SOLIDL_V)&&(Dir==-1)) || ((SOLIDR_V)&&(Dir==1)) ){//Pull
                  
	                     sprite_index=Sprite_pull[SkinImage]; image_speed=0.25;
                  
	                  }else{
      
	                     if(crouch){ sprite_index=Sprite_crouch_walk[SkinImage]; }
	                     else{ sprite_index=Sprite_walk[SkinImage]; }
         
	                     if(Player_movement<-6)||(Player_movement>6){image_speed=0.5;}else{image_speed=0.25;}
                  
	                  }
                  
	          }
	          else if(state==Playerstate.sprint)&&(_cansprint){//Sprint state
        
	                  Idleclock=0; IdlePos=-1;//Reset idle cycle
      
	                  if(crouch){ sprite_index=Sprite_crouch_sprint[SkinImage]; }
	                  else{ sprite_index=Sprite_sprint[SkinImage]; }
         
	                  if(hspeed>7)||(hspeed<-7){image_speed=1;}else{image_speed=0.5;}
                  
	          }
    
	     }

    
	
	   }else{
		
		  sprite_index = spr_player_attack;
		  image_speed  = 0.6 + (0.05) * global.upgrade[? "MeleeSpeed"];
		  if(image_index>=image_number-1){
			 state = Playerstate.idle;  
		  }
		
	   }
	
    
	  }else{//Groundpound state

	       Idleclock=0; IdlePos=-1;//Reset idle cycle 

	       if(!onfloor){ sprite_index=Sprite_roll[SkinImage]; }
	       else{ sprite_index=Sprite_crouch_idle[SkinImage]; }
   
	       if(image_speed==0){ image_index=3; }
       
	  }   

  
  
	  //DCollision masks
	  if(crouch){
  
	     Spritemask=spr_player_idle;
     
	  }
	  else{
  
	     Spritemask=spr_player_idle;
     
	  }

	  mask_index = Spritemask;

	  //Click the player to trigger the first idle anomation
	  if(point_in_circle(mouse_x,mouse_y,x,y-32,32))&&(mouse_check_button_pressed(mb_left)){
   
	     Idleclock=Idleclock_max; IdlePos=0;
   
	  }

	  //Fix values
	  if(IdlePos>2){IdlePos=-1;}
	  if(Idleclock<5)&&(IdlePos==2){IdlePos=-1;}


      if(obj_mvm_controller.mvm_state==MVMSTATE.lose){
		 sprite_index=spr_player_lost;   
		 Control=0;
		 hspeed = sin(current_time*0.01)*1.5;
		 Dir = sign(hspeed);
		 if(Dir==0){Dir=1;}
	  }
  
  
	//}else{ image_speed=0; }//Stop image speed during the second cutscene state
//


}
