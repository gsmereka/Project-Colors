shader_type canvas_item;
render_mode light_only;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, repeat_disable, filter_nearest;
uniform vec4 color : source_color;
uniform float level = 0.25;

void fragment()
{
    // Defina a cor vermelha
    
    // Misture a cor vermelha com a cor original do fragmento
    COLOR = mix(texture(SCREEN_TEXTURE, SCREEN_UV), color, level);
}
	
    //// Calcular a média dos componentes de cor para obter a escala de cinza
    //float gray = (original_color.r + original_color.g + original_color.b) / 3.0;
//
    //// Adicionar uma onda suave baseada no tempo para criar um efeito de água
    //float wave = sin(UV.x * 10.0 + time) * 0.05;
//
    //// Definir a cor do fragmento para a escala de cinza com o efeito de água
    //COLOR = vec4(gray + wave, gray + wave, gray + wave, original_color.a);
//}

//void fragment() {
    //// Obter a cor original do fragmento
    //vec4 original_color = texture(TEXTURE, UV);
//
    //// Calcular a média dos componentes de cor para obter a escala de cinza
    //float gray = (original_color.r + original_color.g + original_color.b) / 3.0;
//
    //// Definir a cor do fragmento para a escala de cinza
    //COLOR = vec4(gray, gray, gray, original_color.a);
//}

//void fragment(){
  //COLOR = vec4(0.4, 0.6, 0.9, 1.0);
//}

//void fragmen2t(){
	//vec4 color = texture(TEXTURE,UV);
//
	//if (color.a == 1.0)
	//{
    	//if (color.rgb != vec3(1.0) && color.rgb != vec3(0.0))
		//{
        	//color *= vec4(1.0);
    	//}
	//}
	//COLOR = color;
//}
