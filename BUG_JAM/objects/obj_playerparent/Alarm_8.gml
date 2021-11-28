/// @description Set sprites

   with(obj_controller){

     scr_load_costumes_all();
     
   }
     
      for(var a=0; a<global.costume_number; a++){
  
          if(a!=global.current_modcostume){
      
             scr_free_costume(a);
      
          }
  
      }

  


Sprite_idle[1]          = global.costume_sprite[0,global.current_modcostume];
Sprite_idle2[1,0]         = global.costume_sprite[1,global.current_modcostume];
Sprite_idle2[1,1]         = global.costume_sprite[2,global.current_modcostume];
Sprite_idle2[1,2]         = global.costume_sprite[3,global.current_modcostume];
IdleImage[1]              = global.loopframe[global.current_modcostume];

Sprite_pull[1]          = global.costume_sprite[13,global.current_modcostume];
Sprite_jump[1]          = global.costume_sprite[6,global.current_modcostume];
Sprite_sprint[1]        = global.costume_sprite[5,global.current_modcostume];
Sprite_fall[1]          = global.costume_sprite[7,global.current_modcostume];
Sprite_walk[1]          = global.costume_sprite[4,global.current_modcostume];
Sprite_roll[1]          = global.costume_sprite[8,global.current_modcostume];
Sprite_crouch_idle[1]   = global.costume_sprite[9,global.current_modcostume];
Sprite_crouch_walk[1]   = global.costume_sprite[10,global.current_modcostume];
Sprite_crouch_sprint[1] = global.costume_sprite[11,global.current_modcostume];
Sprite_death[1]         = global.costume_sprite[12,global.current_modcostume];
imagestop[1]            = global.stopframe[global.current_modcostume];

