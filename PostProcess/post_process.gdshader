shader_type spatial;
render_mode cull_disabled, unshaded, shadows_disabled, depth_draw_never, skip_vertex_transform;

uniform sampler2D screen_texture : source_color, hint_screen_texture;
const vec2 vertices[3] = { vec2(-1.0f, -1.0f), vec2(3.0f, -1.0f), vec2(-1.0f, 3.0f) };

void vertex()
{
	POSITION = vec4(vertices[VERTEX_ID], 0.0f, 1.0f);
}

void fragment()
{
	const float distance_from_centre = distance(SCREEN_UV, vec2(0.5f, 0.5f));
	ALBEDO = texture(screen_texture, SCREEN_UV).rgb * mix(vec3(1.0f), vec3(25.0f, 0.0f, 0.0f), pow(distance_from_centre, 5.0f));
}
