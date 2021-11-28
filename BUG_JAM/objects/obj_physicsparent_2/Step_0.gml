/// @description Insert description here
// You can write your code in this editor

if(vspeed<max_vsp){ vspeed+=grav; }

var _semicol = collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom+min(vspeed,3),obj_semisolid,0,0);

if(_semicol){

   if(bbox_bottom<_semicol.bbox_top+6){
	   
	   if(vspeed>=0){
		
		  y=_semicol.bbox_top+( sprite_yoffset-(bbox_bottom-bbox_top) );
		  
		  vspeed=0;
		                        
		
	   }
   }
	
}


#region Slope

var _trueCenter = bbox_left+(bbox_right-bbox_left)/2;

var _slop = collision_line(bbox_left+_trueCenter-4,bbox_bottom-16,bbox_left+_trueCenter+4,bbox_bottom+min(8,vspeed)+1,obj_slopeparent,0,0);


if(_slop){

   if(vspeed>=0){
	   
	   
	  
	   
	   vspeed=0;
	  
	   with(_slop){
             scr_slope_calculatepos();
       }  
	   
	    while(!collision_rectangle(_trueCenter-4,bbox_bottom-16,_trueCenter+4,bbox_bottom/*y+6.8+6*/,_slop,1,0)){
           y++;
       }
	   
   }

}

#endregion
