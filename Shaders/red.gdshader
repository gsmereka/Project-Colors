shader_type canvas_item;
render_mode light_only;

uniform vec4 color : source_color;

void fragment() {
    // Cor original do pixel
    vec4 original_color = texture(TEXTURE, UV);

    // Misturando com vermelho
    vec4 red_tint = vec4(1.0, 0.0, 0.0, 1.0);
    //vec4 final_color = mix(original_color, red_tint, color.r);
	vec4 final_color = mix(original_color, red_tint, 0.5);

    // Saída final
    COLOR = final_color;
}