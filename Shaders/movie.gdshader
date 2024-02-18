shader_type canvas_item;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, repeat_disable, filter_nearest;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
}

void light ()
{
	vec4 gray2 = textureLod(SCREEN_TEXTURE, SCREEN_UV, 0.0);

	if (LIGHT_COLOR.a == 1.0)
		LIGHT = gray2;
}
