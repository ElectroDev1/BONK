/// @description scr_jump();
function scr_jump() {
	/*
	**
	**  Usage:
	**     scr_jump()
	**
	**
	**  Purpose:
	**     manages jump behaviour
	**  
	*/
	if(jumps>0){
	if(state!=Playerstate.attack){state=Playerstate.jump;}
	y--;
	Vsp_super=0;
	alarm[3]=10;
	inwallkick=0;
	//Decrease the jump meter and jump
	Vsp = -jumpforce * (1 + 0.1*global.upgrade[? "JumpHeight"]);
	  jumps--;
	  
	  audio_play_sound(snd_jump,2,0)
	}

}
