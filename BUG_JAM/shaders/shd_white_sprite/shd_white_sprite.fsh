//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec3  u_color;
uniform float u_alpha;

void main()
{
    //gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	vec4 color = texture2D( gm_BaseTexture, v_vTexcoord );
	
	//gl_FragColor.rgb = u_color;
	
   // gl_FragColor.a = color.a-(1.0-u_alpha);
   
   vec3 c = u_color;
   
   gl_FragColor = vec4(u_color.r,u_color.g,u_color.b,color.a-(1.0-u_alpha));
}

