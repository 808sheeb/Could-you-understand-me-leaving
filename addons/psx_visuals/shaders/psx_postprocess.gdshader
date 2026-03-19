shader_type canvas_item;

#include "uid://bbm41nyy2th3f"

global uniform int psx_bit_depth;
global uniform vec2 resolution;

uniform sampler2D SCREEN_TEXTURE: hint_screen_texture, filter_nearest;

void fragment() {
	vec2 uv = floor(SCREEN_UV * resolution) / resolution;
	vec4 color = texture(SCREEN_TEXTURE, uv);
	COLOR = vec4(dither(color, FRAGCOORD.xy, psx_bit_depth).rgb, 1.0);
}
