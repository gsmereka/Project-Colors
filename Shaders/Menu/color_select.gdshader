shader_type canvas_item;

uniform vec4 color : source_color;

void fragment() {
    // Cor original do pixel
    vec4 original_color = texture(TEXTURE, UV);
    //vec4 final_color = mix(original_color, red_tint, color.r);
	vec4 final_color = vec4(color.r, color.g, color.b, original_color.a);
	
    // Saída final
    COLOR = final_color;
}