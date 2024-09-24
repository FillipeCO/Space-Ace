//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	// desenha a sprite toda branca
	// pegando como a sprite se desenha normalmente
	vec4 cor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	cor.rgb = vec3(1.0, 1.0, 1.0);
	
	// desenha a minha sprite normalmente
    gl_FragColor = cor;
}