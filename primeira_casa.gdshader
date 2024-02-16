shader_type canvas_item;


uniform vec2 rect_position; // Posição do quadrado na tela
uniform vec2 rect_size;     // Tamanho do quadrado na tela
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

void fragment() {
    // Transforma as coordenadas do fragmento em coordenadas de tela
    vec2 screen_uv = (FRAGCOORD.xy - rect_position) / rect_size;

    // Obtém a cor do pixel na posição de tela
    vec4 col = textureLod(SCREEN_TEXTURE, screen_uv, 0.0);

    // Define a cor do fragmento como a cor do pixel na posição de tela
    COLOR = col;
}