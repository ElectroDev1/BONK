/// @description Insert description here
// You can write your code in this editor
var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);


BKGoffset[1]+=0.1;

if(instance_exists(obj_camera)){

var _b = ds_map_find_first(background_map);
var a=0;
repeat(ds_map_size(background_map))
    {
    layer_x(_b, background_map[? _b] * obj_camera._fx-BKGoffset[a]);
    _b = ds_map_find_next(background_map, _b);
	a++
    }
	
}