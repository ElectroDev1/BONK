


var lay_id = layer_get_id("instances");
if !layer_get_shader(lay_id)
{
    layer_shader(lay_id, shd_wave);
    layer_script_begin(lay_id,shdfunc);
}

if(!surface_exists(surf)){
	
   //Create the surface if it doesn't exist	
   surf=surface_create(width,height);	
}else{

   surface_set_target(surf);
   

   
     //Draw the "holes" in the surface
     draw_clear_alpha(c_white,0)
   
     draw_circle(width/7,90,85+(sin(current_time*0.01)*20),0);
     draw_circle(width/1.5,height/1.5,125,0);
   
     draw_line_width(width/2,height/2,width/2+lengthdir_x(200,current_time/2),
     height/2+lengthdir_y(200,current_time/2),16);
   
   
   //This will turn the stuff drawn before into holes
   gpu_set_colorwriteenable(1,1,1,0);
   
   
   //We essentially draw a part of the entire screen and apply a shader on top,
   //this way we can maniuplate everything easily
   
   shader_set(shd_wave);
   shader_set_uniform_f(uTime, current_time);
   shader_set_uniform_f(uTexel, 0.0125, 0.005);
   
   draw_surface_part_ext(application_surface,
   max(x-width/2,0),max(y-height/2),min(x+width/2,room_width),min(y+height/2,room_height)
   ,0,0,1,1,c_red,1)
  
   shader_reset();
   
   
   //Set shit back to normal you fucking idiot
   gpu_set_colorwriteenable(1,1,1,1);

   surface_reset_target();
   
   
   //Draw a base and the surface
   draw_set_colour(c_green);
   draw_rectangle(x-width/2,y-height/2,x+width/2,y+height/2,0);
   draw_set_colour(c_white);
   draw_surface(surf,x-width/2,y-height/2);

}
draw_rectangle(x-960/4,y-540/4,x+960/4,y+540/4,1)