/// @description Level won
// You can write your code in this editor
with(obj_persistent){ fade = 1; }
with(obj_playerparent){Control = 0;}
 global.datamap[? "Money_"+string(0)] = total_money-starting_money;
 global.datamap[? "Grade_"+string(0)] = total_grade;
 global.won=1;
alarm[4] = 2*room_speed;