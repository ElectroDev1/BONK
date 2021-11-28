/// @description Insert description here
// You can write your code in this editor
hspeed = movespeed * dir;

if(vspeed<max_vspeed){
   vspeed += grav;	
}

var _collided = 0;

var _semi = 
collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_semisolid,true,false)

if(_semi){
	

     if(_semi.object_index == obj_semisolid){
		
		if(vspeed>=0)&&(bbox_bottom<=_semi.bbox_top+16){
		   _collided = 1;	
		}
		
	 }else{ _collided = 1; }

}

if(collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_slopeparent,true,false)){
	_collided = 1;
}

if(_collided){ event_user(0); }