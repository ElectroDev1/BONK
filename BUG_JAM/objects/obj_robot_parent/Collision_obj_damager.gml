/// @description Insert description here
// You can write your code in this editor
health -= other.attack;

if(health<=0){
   	event_user(0);
	instance_destroy();
}