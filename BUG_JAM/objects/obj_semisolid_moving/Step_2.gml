//obj_movement_parent
if(!instance_exists(obj_debug_room_controller)){visible=global.debug;}else{ visible=true; }

event_inherited();



//if (vspeed!=0 || hspeed!=0){ 

    var Playercol = collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_playerparent, 0, 0);

    if(Playercol)&&(Playercol.state!=Playerstate.jump)&&(Playercol.bbox_bottom < yprevious+6){
    
       with(Playercol){
       
         if(Vsp_final>=0){floortype=other.material;}
       
           if(Vsp_final > 0){
        
              if(Vsp_final > 3){ event_user(5); scr_stepsound(floortype); }  
         
              if(Vsp_final>9){ Xscale_F=1.3; Yscale_F=0.7; alarm[3]=10; scr_gamepad_reset_vibration(0.4,0.4,2); }
              else if(Vsp_final>3){ Xscale_F=1.1; Yscale_F=0.9; alarm[3]=10; }
    
         
              //Cancel the groundpound
              if(groundP==true){             
                 event_user(4);
                 event_user(1);
              }
         
        
        
           }
                  
            event_user(0);
        
         
            //Stop vertical speed 
            Vsp_final=0;      
            Vsp=0;
            grav=0; 
         
            onfloor=1; 

        
       }
       
    
       //Snap the player
       Playercol.y = ceil(bbox_top-16); Playercol.onfloor=true;
           
       Playercol.x += x-xprevious;
       
        if(collision_rectangle(Playercol.bbox_right-1, Playercol.bbox_top+4, Playercol.bbox_right+spd, Playercol.bbox_bottom-4, obj_solid, 1, 1)){

                   Playercol.x--;
                }
              else if (collision_rectangle(Playercol.bbox_left-spd, Playercol.bbox_top+4, Playercol.bbox_left+1, Playercol.bbox_bottom-4, obj_solid, 1, 1)){

                   Playercol.x++;                 

                }
                
       
       
       
    }
    
    
    //Move physisc parents
    
    //Get a ds list of all the objects in contact with the platform
    var list = scr_collision_rectangle_list(bbox_left, bbox_top-10, bbox_right, bbox_top+4, obj_physicsparent,0,0);
    
    if(list){
    
    
      //Get the amount of objects
      var count = ds_list_size(list);
      
      
      //Iterate through the items
      if(count>0){
        
         for(var a=0; a<count; a++){
         
             if(list[| a].Vsp>=0)&&(list[| a].bbox_bottom < yprevious+7){
             
                list[| a].Vsp=0;
                list[| a].grav=0;
                list[| a].onfloor=1;
               
                //Snap the object vertically
                list[| a].y = bbox_top- (list[| a].sprite_yoffset * list[| a].image_yscale);
             
              //Snap the player horizontally
                list[| a].x += x-xprevious;
 
              if(collision_rectangle(list[| a].bbox_right-1, list[| a].bbox_top+4, list[| a].bbox_right+spd, list[| a].bbox_bottom-4, obj_solid, 1, 1)){

                   list[| a].x--;
                }
              else if (collision_rectangle(list[| a].bbox_left-spd, list[| a].bbox_top+4, list[| a].bbox_left+1, list[| a].bbox_bottom-4, obj_solid, 1, 1)){

                   list[| a].x++;                 

                }
                
                
             }
         
         }
      
      }
      
      //Destroy the list I hate memory leaks I hate memory leaks I hate memory leaks
      ds_list_destroy(list);
      
    }
    
    


//}

