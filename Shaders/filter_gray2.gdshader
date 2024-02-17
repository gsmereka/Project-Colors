shader_type canvas_item;
//render_mode light_only;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

void fragment() {
	vec4 original_color = textureLod(screen_texture, SCREEN_UV, 0.0);

	float gray = (original_color.r + original_color.g + original_color.b) / 3.0;
	COLOR = vec4(gray, gray, gray, original_color.a);
	//COLOR.rgb = COLOR.rrr;
}
