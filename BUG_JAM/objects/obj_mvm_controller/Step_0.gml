/// @description Insert description here
// You can write your code in this editor



timepos++;
	 var _wave = mvm_wave+1;
	 
	 if(keyboard_check(vk_escape)){
		escape_time++;
		
		if(escape_time>3.5*room_speed)&&(obj_persistent.fade==0){
		   
		   with(obj_persistent){ fade = 1; }
           with(obj_playerparent){Control = 0;}
           alarm[4] = 1*room_speed;
		   
		}
	 }else{escape_time=0;}
		 
	 
if(loaded){
		
		
		
	  switch (mvm_state) {
		  
		     case MVMSTATE.setup:
			 
			      if(keyboard_check_pressed(ord("1"))){mvm_wave=0;get_wave_stats(mvm_level,mvm_wave);}
			      if(keyboard_check_pressed(ord("2"))){mvm_wave=1;get_wave_stats(mvm_level,mvm_wave);}
			      if(keyboard_check_pressed(ord("3"))){mvm_wave=2;get_wave_stats(mvm_level,mvm_wave);}
			      if(keyboard_check_pressed(ord("4"))){mvm_wave=3;get_wave_stats(mvm_level,mvm_wave);}
			      if(keyboard_check_pressed(ord("5"))){mvm_wave=4;get_wave_stats(mvm_level,mvm_wave);}
				  
				  if(keyboard_check_pressed(vk_right)){ spendable_money+=1000; }
				  if(keyboard_check_pressed(vk_left)){ spendable_money-=1000; }

			 
			      if(timepos%room_speed==0){ countdown--; }
				  
				  if(countdown<=0){ 
					  
					 timepos=0;
					 
					 
					 show_debug_message(" ");
					 show_debug_message("Starting wave "+string(mvm_wave)+" of "+string(mvm_wavecount));
					 
					 
					 if(mvm_wave<floor(mvm_wavecount/2)){ 
						scr_play_music("first_wave_start.ogg",1,0,0.5); 
					 }
					 else if(mvm_wave==mvm_wavecount-1){ 
						scr_play_music("final_wave_start.ogg",1,0,0.5); 
					 }
					 else{ scr_play_music("mid_wave_start.ogg",1,0,0.5); }
					 
					 mvm_state = MVMSTATE.attack;		
					 subwavepos = 0;
					 mvm_subwave=0;
					 
					 start_subwave(0);
					  
				  }
				  
				  if(keyboard_check_pressed(vk_f4)){ countdown = 0; }
			 
			 break;
		  
		     
			 case MVMSTATE.attack:
			 /*
			 In order for a wave to end, every subwave in it must be cleared.
			 We go through each and every subwave one at a time,
			 when the time matches the time to spawn a set of robots, we check if we've already done that
			 and if not, we spawn them
			 When we're at the end of a subwave, we see if we have to wait for all robots to be cleared
			 or not
			 */
			 
			 //Access the subwave
			 var _mainlist    = MVM_WAVES[? mvm_level]; //Access the level
	         var _wavemap     = _mainlist[? mvm_wave]; //Access the wave
			 
			 var _subwave     = _wavemap[| mvm_subwave];
			 var _subwave_counts = ds_map_size(_subwave)-1;
			 
			 var _mone        = _subwave[? "properties"][0];
			 var _wait        = _subwave[? "properties"][1];
			 var _bomb        = _subwave[? "properties"][2];
			 
			 //Calculate money
			 
			 
			 for(var a=0; a<_subwave_counts; a++){
			     var _list = _subwave[? string(a)];
				 var _type = _list[0];
				 var _numb = _list[1];
				 var _time = _list[2];
				 var _spawn = _list[3];
				 
				  
				  
				  if(timepos==2)&&(!instance_exists(obj_usb)){
					 with(obj_robot_spawner){
						  if(SPAWN_ID == 0){ instance_create_depth(x,y,depth+2,obj_usb); }
					 }
				  }
				 
				 //It's time, spawn the robots
				 if(timepos==_time)&&(_type<array_length(global.ROBOTS)){
					 
					
					//Spawn robots 
				    with(obj_robot_spawner){
						
					     if(SPAWN_ID==_spawn)&&(object_exists(global.ROBOTS[_type])){
							 
							if(_bomb){
								
							   show_debug_message("Created robot '"+string(object_get_name(global.ROBOTS[_type]))+"' at spawn "+string(_spawn));
							
							   with(instance_create_layer(x+240,y,layer_get_id("entities"),global.ROBOTS[_type])){
								
									 money = obj_mvm_controller._divided_money + obj_mvm_controller._leftover;
							   }
							   
							   repeat(_numb-1){
								   with(instance_create_layer(x+irandom_range(-200,200),y,layer_get_id("entities"),global.ROBOTS[_type])   
							        ){ money = obj_mvm_controller._divided_money }
							   
							   }
							   
							}else{
							
							   with(instance_create_layer(x+240,y,layer_get_id("entities"),global.ROBOTS[_type])){
								   
									 money = obj_mvm_controller._divided_money + obj_mvm_controller._leftover;
							   }
							   
							   repeat(_numb-1){
								  with( instance_create_layer(x+irandom_range(-200,200),y,layer_get_id("entities"),global.ROBOTS[_type])   
							      ){ money = obj_mvm_controller._divided_money }
							  
							  }
								
							}
							
						 }
						 
					}
					
					subwavepos++;
					
				 }
				 
				 
			 }

             //We're at the final subwave	
		     if(subwavepos>=_subwave_counts){
				 
				 var _level    = MVM_WAVES[? mvm_level]; //Access the level
				 var _Awavemap     = _level[? mvm_wave];
				 var _Asubwaves    = ds_list_size(_Awavemap)
				 
				
				 
				if(mvm_subwave+1 < _Asubwaves){//Not at the final subwave
					
				   show_debug_message(_Asubwaves);
			       //var _subwave     = _wavemap[| mvm_subwave+1];
				   var _wait        = 1
				   
				   var ok = 0; if(!_wait){ok=1;}else if(!instance_exists(obj_robot_parent)){ok=1;}
				   
				   if(ok){
					 subwavepos = 0;
					 mvm_subwave++;
					 
					 start_subwave(mvm_subwave);   
				   }
				   
				}else{
				
				  //Wave end 
				  if(!instance_exists(obj_robot_parent)){
					 
					 show_debug_message(mvm_wavecount);
					 if(mvm_wave<floor(mvm_wavecount/2)){ scr_play_music("first_wave_end.ogg",1,0,0.5); mvm_state = MVMSTATE.win; alarm[1] = 12*room_speed; }
					 else if(mvm_wave==mvm_wavecount-1){  scr_play_music("final_wave_end.ogg",1,0,0.5); mvm_state = MVMSTATE.over; alarm[3]=25*room_speed;   }
					 else{ scr_play_music("mid_wave_end.ogg",1,0,0.5); alarm[1] = 12*room_speed; mvm_state = MVMSTATE.win;    }
					 
					
					  
				  }
				
				}
				
				
				
			 }
			 
			 break;
		  
		  
	  }
	  
	  if(mvm_state!=MVMSTATE.setup)&&(mvm_state!=MVMSTATE.lose){
		 //Calculate grades
		 var _real_money = total_money - starting_money;
 
         var _real_wave_money = wave_money;
		 
		 //Total grade
		 var totpercent = level_final_money/100;
		 var percent = _real_money / totpercent;
		 
		 if(percent==100){ total_grade = 0; }
		 if(percent<100)&&(percent>=90){ total_grade = 1; }
		 if(percent<90)&&(percent>=80){ total_grade = 2; }
		 if(percent<80)&&(percent>=70){ total_grade = 3; }
		 if(percent<70)&&(percent>=60){ total_grade = 4; }
		 if(percent<60)&&(percent>=50){ total_grade = 5; }
		 if(percent<50)&&(percent>=40){ total_grade = 5; }
		 if(percent<40)&&(percent>=30){ total_grade = 6; }
		 if(percent<30){ total_grade = 6; }
		 
		 //Wave grade
		 var totpercent = wave_final_money/100;
		 var percent = _real_wave_money / totpercent;
		 
		 if(percent==100){ wave_grade = 0; }
		 if(percent<100)&&(percent>=90){ wave_grade = 1; }
		 if(percent<90)&&(percent>=80){ wave_grade = 2; }
		 if(percent<80)&&(percent>=70){ wave_grade = 3; }
		 if(percent<70)&&(percent>=60){ wave_grade = 4; }
		 if(percent<60)&&(percent>=50){ wave_grade = 5; }
		 if(percent<50)&&(percent>=40){ wave_grade = 5; }
		 if(percent<40)&&(percent>=30){ wave_grade = 6; }
		 if(percent<30){ wave_grade = 6; }
		 
		 
	  }
	   
}
	