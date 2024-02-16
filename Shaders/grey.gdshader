shader_type canvas_item;
//render_mode light_only;
//uniform vec4 modulate : hint_color = vec4(1.0);

uniform float time = 5;

void fragment() {
    // Obter a cor original do fragmento
    vec4 original_color = texture(TEXTURE, UV);

    // Calcular a média dos componentes de cor para obter a escala de cinza
    float gray = (original_color.r + original_color.g + original_color.b) / 3.0;

    // Determinar se o pixel é azul, vermelho, amarelo ou verde
    float blue_threshold = 0.000005;
    float red_threshold = 0.15;
    float green_threshold = 1.05;
    float yellow_threshold = 0.51;

    bool is_blue = original_color.b > max(original_color.r, original_color.g) + blue_threshold;
    bool is_red = original_color.r > max(original_color.b, original_color.g) + red_threshold;
    bool is_green = original_color.g > max(original_color.r, original_color.b) + green_threshold;
    bool is_yellow = (original_color.g > 200.0 && original_color.r > 200.0 && original_color.b < 100.0);
    // Se for uma das cores desejadas, manter a cor original, caso contrário, converter para escala de cinza
    vec4 result_color;
    //if (is_blue || is_red || is_green || is_yellow) {
        //result_color = original_color;
    if (is_yellow) {
        result_color = original_color;
    } else {
        result_color = vec4(gray, gray, gray, original_color.a);
    }

    // Definir a cor do fragmento
    COLOR = result_color;
}


//void fragment() {
    //// Obter a cor original do fragmento
    //vec4 original_color = texture(TEXTURE, UV);
//
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
