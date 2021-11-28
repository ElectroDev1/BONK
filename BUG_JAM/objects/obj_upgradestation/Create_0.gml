/// @description Insert description here
// You can write your code in this editor
upgrade_surf = -4;
VIS = false;
depth=15;

disk_spent = 0;

//Menu
WeaponPage = 0;

enum Pages {
	 player,
     melee,
	 spark,
	 disk
}

WeaponPage = Pages.player;

UpgradePos = 0;

Pageicon[3] = spr_player_icon_player;
Pageicon[2] = spr_player_icon_spark;
Pageicon[1] = spr_player_icon_bat;
Pageicon[0] = spr_player_icon_disc;


//Set up upgrades
/*
page index

1 - upgrade
2 - price
3 - max amount of upgrades
4 - icon sprite
5 - name
6 - description
*/

Upgrade[Pages.player,0] = ["WalkSpeed"  ,200,3,spr_ability_icon_player_speed,"+20% walk speed","Walk faster."];
Upgrade[Pages.player,1] = ["Resistance" ,300,3,spr_ability_icon_player_def,"+25% resistance","Take less\ndamage."];
Upgrade[Pages.player,2] = ["JumpHeight" ,200,3,spr_ability_icon_player_jump,"+20% jump height","Jump higher."];
Upgrade[Pages.player,3] = ["HealthReg"  ,200,3,spr_ability_icon_player_healthreg,"+2 health regen.","Regenerate 2\nHP a second."];

Upgrade[Pages.spark,0] =  ["ChargeSpd"  ,250,3,spr_ability_icon_spark_chargespeed,"+15% Charge rate","Spark charges\n15% faster."];
Upgrade[Pages.spark,1] =  ["Spread"     ,100,3,spr_ability_icon_spark_spread,"+10% Spread","10% bigger\nspark range."];
Upgrade[Pages.spark,2] =  ["Slowdown"   ,200,1,spr_ability_icon_spark_slowdown,"Slowdown","Sparked enemies\nwalk slower."];

Upgrade[Pages.melee,0] =  ["MeleeSpeed" ,200,3,spr_ability_icon_melee_speed,"+10% Atk. Speed","Swing weapon\n10% faster."];
Upgrade[Pages.melee,1] =  ["MeleeRange" ,200,3,spr_ability_icon_melee_range,"+10% Atk. Range","Weapon range is\n10% bigger."];
Upgrade[Pages.melee,2] =  ["Knockback"  ,100,3,spr_ability_icon_melee_knockback,"+10% Knockback","Launch enemies\naway."];
Upgrade[Pages.melee,3] =  ["MoneyMagnet",150,3,spr_ability_icon_melee_moneymagnet,"Money magnet","Attract money\near you."];

Upgrade[Pages.disk,0]  =  ["HomeReturn" ,10,3,spr_ability_icon_disc_homereturn,"Spawn return","Teleport back\nto spawn."];
Upgrade[Pages.disk,1]  =  ["Explosion"  ,75,3,spr_ability_icon_disc_explosion,"Explosion","Kill enemies\nnear you."];
Upgrade[Pages.disk,2]  =  ["Invincible" ,100,3,spr_ability_icon_disc_invincible,"Invincibility","Ivincibility for\n8 seconds."];

clear_upgrades = function(){
global.upgrade[? "WalkSpeed"] = 0;
global.upgrade[? "JumpHeight"] = 0;
global.upgrade[? "Resistance"] = 0;
global.upgrade[? "HealthReg"] = 0;

global.upgrade[? "ChargeSpd"] = 0;
global.upgrade[? "Spread"] = 0;
global.upgrade[? "Slowdown"] = 0;

global.upgrade[? "MeleeSpeed"] = 0;
global.upgrade[? "MeleeRange"] = 0;
global.upgrade[? "Knockback"] = 0;
global.upgrade[? "MoneyMagnet"] = 0;

global.upgrade[? "HomeReturn"] = 0;
global.upgrade[? "Explosion"] = 0;
global.upgrade[? "Invincible"] = 0;
	
}