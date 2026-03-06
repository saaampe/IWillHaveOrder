shader_type canvas_item;

uniform sampler2D overlay_texture : repeat_enable, filter_nearest;
uniform vec2 texture_scale = vec2(17.0,5.0);
uniform bool is_active = true;
void fragment() {
	if(is_active)
	{
		vec2 scaled_uv = UV * texture_scale;
		vec4 texture_color = texture(overlay_texture, scaled_uv);
		COLOR = COLOR * texture_color;
	}
}

