shader_type canvas_item;

uniform vec4 original_0 : source_color;
uniform vec4 original_1 : source_color;

uniform vec4 replace_0 : source_color;
uniform vec4 replace_1 : source_color;

const float precision = 0.1;

vec4 replace_color(vec4 color) {
    if (distance(color.rgb, original_0.rgb) <= precision) {
        return replace_0;
    } else if (distance(color.rgb, original_1.rgb) <= precision) {
        return replace_1;
    }
    return color;
}

void fragment() {
    vec4 sampledColor = texture(TEXTURE, UV);
    COLOR = sampledColor; // Display actual color from the texture
}
