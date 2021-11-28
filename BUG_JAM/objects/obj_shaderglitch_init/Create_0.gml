/// @description Insert description here
// You can write your code in this editor

START = function(){
	bktglitch_activate();

    // Quickly setting all parameters at once using a preset
    

bktglitch_config(0.001333, 0.010000, 0.080000, 0.000000, 0.026667, 0.593333, 1.166667, 0.600000, 0.073333, 0.000000, 0.000000, 0.000000, 0.200000, 0.200000, 0.026667);
}

layer_script_begin(layer_get_id("Tiles_1"),START)


layer_script_begin(layer_get_id("Tiles_3"),START)

START = function(){
   bktglitch_activate();

bktglitch_config(0.000000, 0.000000, 0.000000, 0.140000, 0.000000, 0.593333, 1.833333, 0.600000, 0.213333, 0.000000, 0.000000, 0.000000, 0.200000, 0.200000, 0.726667);
}

layer_script_begin(layer_get_id("Tiles_2"),START)


END = function(){
bktglitch_deactivate();
}

layer_script_end(layer_get_id("Tiles_1"),END)
layer_script_end(layer_get_id("Tiles_2"),END)
layer_script_end(layer_get_id("Tiles_3"),END)


START = function(){
   bktglitch_activate();
bktglitch_config(0.000000, 0.000000, 0.000000, 0.140000, 0.000000, 0.593333, 1.833333, 0.053333, 0.293333, 0.000000, 0.000000, 0.000000, 0.200000, 0.200000, 0.726667);
}

layer_script_begin(layer_get_id("Background"),START)
layer_script_end(layer_get_id("Background"),END)
