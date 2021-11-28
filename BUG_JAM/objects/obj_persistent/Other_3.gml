/// @description Save global information
// You can write your code in this editor

var _file = file_text_open_write("Settings.dat");

file_text_write_string(_file,string(global.Window_S));

file_text_close(_file);

ds_map_secure_save(global.datamap,"Game.sav");