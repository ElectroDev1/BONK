/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

attack_strength = 6;

bottom_offset = 0;

time = 0;

stop = 1;
type = Robot.standard;

sprite_dead = spr_robot_standard_dead;
leader = -4;
jumpspeed = 12;
sparked = false;
sparktime = 14*room_speed;
movespeed=3;
bounce = 0;

og_movespeed = movespeed;

attack = 15;
og_delay = 120;
delay = 120;

money = 0;

knock_res = 1;

HP = 150;

enum TargetMode {
     usb = 0,
	 usb_exit = 1,
	 player = 2,
	 insert = 3
}

Target = TargetMode.usb;

annoyance = 0;

knockback_resistance = 0;

Xscale=1;
Yscale=1;

idle_sprite = spr_robot_standard_idle;
walk_sprite = spr_robot_standard_walk;
sprite_insert = spr_robot_standard_insert;

mask_index=spr_robot_standard_idle;


image_speed = 0.75;