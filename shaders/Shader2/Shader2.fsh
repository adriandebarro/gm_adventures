//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D u_background_texture;

void main()
{
    gl_FragColor = v_vColour * texture2D( u_background_texture, v_vTexcoord );
}
