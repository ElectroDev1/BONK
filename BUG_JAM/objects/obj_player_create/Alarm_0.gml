/// @description Create the player

//We did not come from a room
scr_player_create(x,y);

/*if(!obj_controller.fromroom){

    //Create a new player in this object's position
    
    //Should the camera's target be the player?
    if(playercam){
       with(scr_player_create(x,y)){
            obj_camera.Object=id;
       }
    }
    else{ scr_player_create(x,y); }
    
}
else{//Came from a room - handle destination id 

    //If a specific destination has been set
    if(obj_controller.destination_id!=-1){    

       //Should the camera's target be the player?
       if(playercam){
    
         with(obj_controller.destination_id){
              with(scr_player_create(x,y)){ obj_camera.Object=id; }
         }
         
       }else{
           
         with(obj_controller.destination_id){
               scr_player_create(x,y);
          }  
           
       }
    
    
    }//Create the object as normal
    else{
        
        //Should the camera's target be the player?
        if(playercam){
           with(scr_player_create(x,y)){
                obj_camera.Object=id;
           }
        }
        else{ scr_player_create(x,y); }
        
    }
}
*/
