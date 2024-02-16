shader_type canvas_item;
//render_mode light_only;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

void fragment() {
	vec4 original_color = textureLod(screen_texture, SCREEN_UV, 0.0);

	float gray = (original_color.r + original_color.g + original_color.b) / 3.0;
	COLOR = vec4(gray, gray, gray, original_color.a);
	//COLOR.rgb = COLOR.rrr;
}

void light()
{
	vec4 gray2 = textureLod(screen_texture, SCREEN_UV, 0.0);

	if (LIGHT_COLOR.a == 1.0)
		LIGHT = gray2;
	//COLOR = gray2
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
