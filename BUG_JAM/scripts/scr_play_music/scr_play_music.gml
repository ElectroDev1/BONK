// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_play_music(filename="base.ogg",priority = 0,loops = 1,volume = 0.5){
	
	if(!file_exists(filename)){ return -4; }
	
	if(global.stream!=-4){
	

	   audio_stop_sound(global.stream);	
       audio_destroy_stream(global.stream);

	
	}
	
    global.stream = audio_create_stream(filename);

    audio_play_sound(global.stream,priority,loops);
    audio_sound_gain(global.stream,volume,1);

    show_debug_message("Loaded song '"+filename+"'");
 
    return global.stream;

}