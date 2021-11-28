/// @description Insert description here
// You can write your code in this editor

audio_play_sound(snd_coin,2,0);

obj_mvm_controller.wave_money+=value;
obj_mvm_controller.total_money+=value;
obj_mvm_controller.spendable_money+=value;

instance_destroy();