shader_type canvas_item;

uniform float radius : hint_range(0.0, 1.0) = 0.45;
uniform float softness : hint_range(0.0, 1.0) = 0.1; // feather edge
uniform vec4 overlay_color : source_color = vec4(0,0,0,1); // black

void fragment() {
    // UV is 0–1 across the rect
    vec2 uv = UV;

    // Center of the screen
    vec2 center = vec2(0.5, 0.5);

    // Distance from center
    float dist = distance(uv, center);

    // Soft circle mask
    float edge_start = radius;
    float edge_end = radius + softness;
    float mask = smoothstep(edge_start, edge_end, dist);

    // `mask` goes from 0 (transparent center) to 1 (full overlay)
    vec4 final_color = overlay_color;
    final_color.a *= mask;

    COLOR = final_color;
}
