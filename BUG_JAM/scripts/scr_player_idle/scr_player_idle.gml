function scr_player_idle() {
	if(Idleclock<Idleclock_max){
	               sprite_index=Sprite_idle[SkinImage]; image_speed=0.5; Idleclock+=0; if(Idleclock>=Idleclock_max-1){image_index=0; IdlePos++; Idleclock=Idleclock_max}
	               }
	               else{
               
	                    sprite_index=Sprite_idle2[SkinImage,IdlePos]; 
	                    if(IdlePos<2){image_speed=0.25;}else{
                    
	                       if(image_index>IdleImage[SkinImage]){image_speed=0.15;}else{image_speed=0.2}
                       
	                    }
                    
	                    if(image_index>=image_number-1){ if(IdlePos<2){Idleclock=0;}else{image_index=IdleImage[SkinImage];} }
               
	               }



}
