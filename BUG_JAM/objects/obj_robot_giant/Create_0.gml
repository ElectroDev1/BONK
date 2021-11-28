/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

type = Robot.giant;

sprite_dead = spr_giant_dead;

leader = id;

og_delay = 5*room_speed;

sparktime = 2*room_speed;

movespeed=2;
og_movespeed = movespeed;

Target = TargetMode.usb_exit;


bottom_offset=-32;

attack = 50;

attack_strength=20;

idle_sprite = spr_giant;
walk_sprite = spr_giant;
sprite_insert = spr_giant;

mask_index=spr_giant;

HP = 4000;
max_health = HP;