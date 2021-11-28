/// @description Set position

//Respawn

if(instance_exists(obj_hubcontrol)){ //If it's a hubword, go to the map position

   if(global.datamap[? "Map_X"]!=-4){x = global.datamap[? "Map_X"];}
   if(global.datamap[? "Map_Y"]!=-4){y = global.datamap[? "Map_Y"];}
   global.datamap[? "Map_room"]=room;

}
else{//If it's a level

  //Check if player was in the room, if so spawn to latest checkpoint, else the checkpoint is the player's position
  if(obj_controller.checkpointR==room)&&(!obj_controller.speedrun_mode){ 
     x = obj_controller.checkpointX;
     y = obj_controller.checkpointY;
  }
  else if(Checkpoint){
     obj_controller.checkpointX = x;
     obj_controller.checkpointY = y;
     obj_controller.checkpointR =room;
     global.newcoins=0;
  }
 
}

