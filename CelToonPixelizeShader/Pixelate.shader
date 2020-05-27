shader_type canvas_item;
uniform float size_x = 0.0025;
uniform float size_y = 0.001;
void fragment(){
	
	COLOR = textureLod(SCREEN_TEXTURE, SCREEN_UV - mod(SCREEN_UV, vec2(size_x, size_y)), 0.0);
}