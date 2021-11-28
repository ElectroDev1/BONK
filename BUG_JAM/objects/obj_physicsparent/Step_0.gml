

if(vspeed<max_vsp){ vspeed+=grav; }
if(!noclip){
var _semicol = collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom+vspeed+1,obj_semisolid,0,0);

if(_semicol){

   if(bbox_bottom<_semicol.bbox_top+6){
	   
	   if(vspeed>=0){
		
		  y=floor(_semicol.bbox_top+( sprite_yoffset-sprite_get_height(sprite_index) ))+1;
		  
		  if(bounce>0){vspeed=-(vspeed)/max(bounce+1,1);}else{vspeed=0;}
		  
		  unvol_speed=scr_approach(unvol_speed,0,fric_);
		                        
		
	   }
   }
	
}





var Slopesensor=collision_line(x-2,y-8,x+2,bbox_bottom+vspeed,obj_slopeparent,0,0);

if(Slopesensor){ 

   if(vspeed>=0){  
           
           
           //Stop vertical speed      
           if(bounce>0){vspeed=-(vspeed)/max(bounce+1,1);}else{vspeed=0;}
           
		   unvol_speed=scr_approach(unvol_speed,0,fric_);
		   
           with(Slopesensor){
             scr_slope_calculatepos();
           }
           
           
           //Angle
           /*if(Slopesensor.object_index==obj_slope_sl)||(Slopesensor.object_index==obj_slope_sr){
              Angle=45*-Slopesensor.Dir;
           }
        
           if(Slopesensor.object_index==obj_slope_l)||(Slopesensor.object_index==obj_slope_r){
              Angle=45/2*-Slopesensor.Dir;
           }*/
        
        
        while(!collision_rectangle(x-4,y-16,x+4,bbox_bottom,obj_slopeparent,1,0)){
           y++;
        }
       
        
   
   }
}

hspeed = (Dir*(movespeed)*stop + unvol_speed);


//Horizontal collision
SOLIDL=collision_rectangle(bbox_left,bbox_top+1,bbox_left,bbox_bottom-1,obj_solid,1,0);
SOLIDR=collision_rectangle(bbox_right,bbox_top+1,bbox_right,bbox_bottom-1,obj_solid,1,0);

SOLIDL_V=collision_rectangle(bbox_left+hspeed-1,bbox_top+1,bbox_left,bbox_bottom-1,obj_solid,1,0);
SOLIDR_V=collision_rectangle(bbox_right,bbox_top+1,bbox_right+hspeed+1,bbox_bottom-1,obj_solid,1,0);

//Right
if(SOLIDR_V){

   if(hspeed>=0)&&(!SOLIDR){
      
      //event_user(2);
      x=SOLIDR_V.bbox_left-(bbox_right-x)-1;
	  hspeed = 0;
	  unvol_speed=0;
   
   }

}


if(SOLIDR){

   if(hspeed>=0){
      //event_user(2);
	  hspeed = 0;
	  unvol_speed=0;
      
           
  }

  while(collision_rectangle(bbox_right,bbox_top+8,bbox_right+1,bbox_bottom-8,obj_solid,true,false))
       &&(!collision_point(x,bbox_top+1,obj_solid,true,false)){
        x--;
  }
  
}


//Left
if(SOLIDL_V){

   if(hspeed<=0)&&(!SOLIDL){
      
      //event_user(2);
      x=SOLIDL_V.bbox_right+(x-bbox_left)+1;
	  hspeed = 0;
	  unvol_speed=0;
   
   }

}


if(SOLIDL){

   if(hspeed<=0){
      //event_user(2);
      hspeed = 0;
	  unvol_speed=0;
           
  }

  while(collision_rectangle(bbox_left,bbox_top+8,bbox_left-1,bbox_bottom-8,obj_solid,true,false))
       &&(!collision_point(x,bbox_top+1,obj_solid,true,false)){
        x++;
  }
  
}


//Top collision
var SOLIDU=collision_rectangle(bbox_left,bbox_top-1,bbox_right,bbox_top+1,obj_solid,1,0);
var SOLIDU_V=collision_rectangle(bbox_left,bbox_top+vspeed-1,bbox_right,bbox_top+1,obj_solid,1,0);

if(SOLIDU_V){

   if(vspeed<=0)&&(!SOLIDU){
      
      vspeed=0;
      y=SOLIDU_V.bbox_bottom+(y-bbox_top)+1;
   
   }

}


if(SOLIDU){

   if(vspeed<=0){
      
      vspeed=0;
      y=SOLIDU_V.bbox_bottom+(y-bbox_top)+1;
           
  }

  while(collision_rectangle(bbox_right,bbox_top-1,bbox_right+1,bbox_top+3,obj_solid,true,false)){
        y++;
  }
  
}






if(vspeed<0){
   //Top collision
   if(collision_rectangle(bbox_left+1,bbox_top-4,bbox_right-1,bbox_top+1,obj_solid,true,false)){
      vspeed=0;   
   }

}


}

/* */
/*  */
