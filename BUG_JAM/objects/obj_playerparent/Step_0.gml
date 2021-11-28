/// @description Player logic


if(!debug){

if(!collision_rectangle(bbox_right,bbox_bottom-4,bbox_right,bbox_bottom+2,obj_semisolid,1,0)
&& !collision_rectangle(bbox_right,bbox_bottom-4,bbox_right,bbox_bottom+2,obj_semisolid_moving,1,0))
{onfloor=0;}





#region Deal with vertical speed gravity

//Normal
if(Vsp<15)&&(Vsp_super>-1){Vsp=scr_approach(Vsp,10,grav);}
//groundP_special=scr_approach(groundP_special,0,0.5);
//Super jump
Vsp_super=scr_approach(Vsp_super,0,grav);

if(Vsp_final>0){Vsp_super=0;}

//Cap values
if(Vsp_final>10)&&(Vsp<11){Vsp=10;}
if(Vsp_final>18){Vsp_final=18;}

#endregion


//Make the player automiatically go up to the semisolid if near enough and sprinting
if(!onfloor)&&(state==Playerstate.sprint){

   var co=collision_rectangle(bbox_left+5,bbox_bottom-12,bbox_right-5,bbox_bottom-2,obj_semisolid,1,0)
   if(co)&&(co.object_index!=obj_solid){ 
	   if(co){y-=3;} 
	   
   }

}




#region Semisolid handling

//Fall and stop when touching a semisolid 
SemiCollision = collision_rectangle(bbox_left+2,bbox_bottom-6,bbox_right-2,bbox_bottom+Vsp_final+2,obj_semisolid,false,false);


if(Vsp_final>=0)/*&&(sprint_rest==0)*/{
       
       if(SemiCollision)&&(bbox_bottom<SemiCollision.bbox_top+8)//&&(bbox_bottom<SemiCollision.y+10)
       {         
              
                  
           if(Vsp_final>0){
           
                           
               //Cancel the groundpound
               if(groundP==true){
        
                  event_user(4);
                  event_user(1); 
               }
           
           
           }
          
           event_user(0);
           
		   Xscale=1; Yscale=1;
               
              //Stop vertical speed 
              Vsp_final=0;      
              Vsp=0;
              grav=0;    
 
              onfloor=1; 
           
            
            
           //Move with the platform
           
           //X axis
           if(SemiCollision.x!=SemiCollision.xprevious){
              x+=SemiCollision.x-SemiCollision.xprevious;
           }
           
           //Y axis
           /*if(SemiCollision.y!=SemiCollision.yprevious){
              
              
              if(SemiCollision-y>SemiCollision.yprevious){
                 
                 
                 if(sprint){var OFF=15;}else{var OFF=10;}
                 var OFF = 16;
                 y=floor(SemiCollision.bbox_top-OFF);
                 
                 
                 
              }
              else if(!sprint){  y=floor(SemiCollision.bbox_top-16); y+=SemiCollision.y-SemiCollision.yprevious;  }
              
           }
           else{*/y=floor(SemiCollision.bbox_top);//}
                                  
       }    
} 



#endregion


#region Slope


Slopesensor=collision_line(x-2,bbox_bottom-16,x+2,bbox_bottom+2+Vsp,obj_slopeparent,0,0);//collision_line(x-2,y-8*(crouch+1),x+2,y+28+Vsp_final,obj_slopeparent,0,0);


if(Slopesensor){ 

 //Make the player go slower when climbing up
 /*if(Slopesensor.Dir!=Dir){
   if(Player_movement>max_horiz_speed_slope){Player_movement=max_horiz_speed_slope;}
   if(Player_movement<-max_horiz_speed_slope){Player_movement=-max_horiz_speed_slope;}
        
   if(Sprint_movement>4){Sprint_movement=4;}
   if(Sprint_movement<-4){Sprint_movement=-4;} 
   
   if(Non_volountary_mov>4){Non_volountary_mov=4;}
   if(Non_volountary_mov<-4){Non_volountary_mov=-4;}
   
   if(sprint){max_horiz_speed=max_horiz_speed_air;}else{max_horiz_speed=max_horiz_speed_slope;}
 }
 else{ max_horiz_speed=5;}*/

   if(Vsp_final>=0){
   
   
        onfloor=1;     
        
       
        //Player related stuff
        
           //Cancel the groundpound
           if(Vsp_final>0)&&(groundP==true){

              event_user(4);
              event_user(1);
			  //Little bounce and really small boost if holding a direction
                  if(Movement!=0){
                     Non_volountary_mov=5*Dir;
                     y-=10;
                     Vsp=-12;
                  }
              
           }
           
        
        //------------------------------
           
           //Stop vertical speed 
           Vsp_final=0;      
           Vsp=0;
           grav=0;
           
           
           
           event_user(0);   
           
           with(Slopesensor){
             scr_slope_calculatepos();
           }
           
           
           
           
           //Angle
           /*if(Slopesensor.object_index==obj_slope_sl)||(Slopesensor.object_index==obj_slope_sr){
              Angle=45*-Slopesensor.Dir;
           }
        
           if(Slopesensor.object_index==obj_slope_l)||(Slopesensor.object_index==obj_slope_r){
              Angle=45/2*-Slopesensor.Dir;
           }
           
           if(Slopesensor.object_index==obj_slope_gl)||(Slopesensor.object_index==obj_slope_gr){
              Angle=45/2*-Slopesensor.Dir;
           }*/
        
        
        while(!collision_rectangle(x-4,y-16,x+4,bbox_bottom-1/*y+6.8+6*/,obj_slopeparent,1,0)){//while(!collision_rectangle(x-4,y-16,x+4,y+6.8+6,obj_slopeparent,1,0)){
           y++;
        }
       
        sprint=false; 
        x+=Slopesensor.x-Slopesensor.xprevious;
        
   
   }
}else if(!groundP){ max_horiz_speed=7; }



if(!collision_rectangle(bbox_left+22,bbox_top,bbox_right-22,bbox_bottom-2,obj_slopeparent,1,0)){Angle=0;}

#endregion


//--Movement--//
scr_player_behaviour();
scr_player_mvm_behaviour();

update_time++;


#region Ceil slope

//Ceil slope collisions
if(collision_rectangle(bbox_right-8,y-20,bbox_right+1+hspeed,y-12,obj_ceilslopeparent,1,0))
||(collision_rectangle(bbox_left-1+hspeed,y-20,bbox_left+8,y-12,obj_ceilslopeparent,1,0)){

   y+=abs(hspeed)+1;

}

if(collision_rectangle(x-6,y-22,x+6,y-10,obj_ceilslopeparent,1,0)){y+=4;}

//Don't let the player get stuck in a ceiling
if(Vsp_final<=0)&&(collision_rectangle(x-1,bbox_top-4,x+1,bbox_top+4,obj_ceilslopeparent,true,false))&&(!onfloor){y++; Vsp_super=0;}


#endregion


#region Horizontal collision

//Horizontal collision
SOLIDL=collision_rectangle(bbox_left,bbox_top+1,bbox_left,bbox_bottom-1,obj_solid,1,0);
SOLIDR=collision_rectangle(bbox_right,bbox_top+1,bbox_right,bbox_bottom-1,obj_solid,1,0);

SOLIDL_V=collision_rectangle(bbox_left+hspeed-1,bbox_top+1,bbox_left,bbox_bottom-1,obj_solid,1,0);
SOLIDR_V=collision_rectangle(bbox_right,bbox_top+1,bbox_right+hspeed+1,bbox_bottom-1,obj_solid,1,0);

//Right
if(SOLIDR_V){

   if(hspeed>=0)&&(!SOLIDR){
      
      event_user(2);
      x=SOLIDR_V.bbox_left-(bbox_right-x)-1;
   
   }

}


if(SOLIDR){

   if(hspeed>=0){
      event_user(2);
      
           
  }

  while(collision_rectangle(bbox_right,bbox_top+8,bbox_right+1,bbox_bottom-8,obj_solid,true,false))
       &&(!collision_point(x,bbox_top+1,obj_solid,true,false)){
        x--;
  }
  
}


//Left
if(SOLIDL_V){

   if(hspeed<=0)&&(!SOLIDL){
      
      event_user(2);
      x=SOLIDL_V.bbox_right+(x-bbox_left)+1;
   
   }

}


if(SOLIDL){

   if(hspeed<=0){
      event_user(2);
      
           
  }

  while(collision_rectangle(bbox_left,bbox_top+8,bbox_left-1,bbox_bottom-8,obj_solid,true,false))
       &&(!collision_point(x,bbox_top+1,obj_solid,true,false)){
        x++;
  }
  
}


#endregion


#region Top collision

//Top collision
var SOLIDU=collision_rectangle(bbox_left,bbox_top-1,bbox_right,bbox_top+1,obj_solid,1,0);
var SOLIDU_V=collision_rectangle(bbox_left,bbox_top+Vsp_final-1,bbox_right,bbox_top+1,obj_solid,1,0);

if(SOLIDU_V){

   if(Vsp_final<=0)&&(!SOLIDU){
      
      Vsp=0; Vsp_final=0; Vsp_super=0;
      y=SOLIDU_V.bbox_bottom+(y-bbox_top)+1;
   
   }

}


if(SOLIDU){

   if(Vsp_final<=0){
      
      Vsp=0; Vsp_final=0; Vsp_super=0;
      y=SOLIDU_V.bbox_bottom+(y-bbox_top)+1;
           
  }
  
 

  while(collision_rectangle(bbox_right,bbox_top-1,bbox_right+1,bbox_top+3,obj_solid,true,false)){
        y++;
  }
  
}


#endregion




//Ghost trail
if((sprint)&&(_cansprint)&&((hspeed<-4)||(hspeed>4)))
              ||( (scr_input_check(input.action1))&&(Vsp<=0)&&(scr_input_check(input.action0))&&(_cansprint)&&(hspeed!=0) )
              ||((groundP)&&(Vsp_final>7)){
				  
   ghostcan=1;
   
}else{ghostcan=0;}

maxGhost=!groundP+1;

ghost+=3;

if(ghost>maxGhost){

   if(ghostcan && global.effects){
   with(instance_create(x,y+16,obj_effect)){
        sprite_index=other.sprite_index;
        image_speed=0;
        image_index=other.image_index;
        alpha_des=1;
        alpha_spd=0.075;
        image_alpha=0.8;
        Xscale=other.Dir;
        
   }

  }
  ghost=0;
}


//Stay in room
if(y<-96){y=-96;}

if(Control){
x=min(x,room_width-sprite_xoffset);
x=max(x,sprite_xoffset+2);
} 




}
else{//Debug mode babeeeeeee

if(keyboard_check(vk_up)){y-=8;}
if(keyboard_check(vk_down)){y+=8;}
if(keyboard_check(vk_left)){x-=8;}
if(keyboard_check(vk_right)){x+=8;}

Vsp_final=0;
Vsp=0;
vspeed=0;
hspeed=0;

}

//Small air lines
if(Vsp>16)&&(groundP)&&(global.effects){
   with(instance_create(x+choose(-8,-4,4,8),
   y-32+choose(-8,-6,6,8),
   obj_effect)){
        sprite_index=spr_groundpound_line;
        alpha_des=1;
        alpha_spd=0.1;
        Xscale=1;
        Yscale=0.7;
        Yscale_D=2;
        Yscale_S=0.3;
   }
}

if(Xscale!=1)&&(Yscale!=1){
   if(scale_tolerance>0){scale_tolerance--;}else if(!crouch){Xscale=1; Yscale=1; Xscale_F=1; Yscale_F=1;}
}
else{scale_tolerance=35;}