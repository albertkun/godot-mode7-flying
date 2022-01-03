// original mode7 shader from 
// https://gist.github.com/Jellonator/0686c6e74d06745957de5a96fa00ec6c#file-godot_mode7_shader-shader

// shader rotation from 
// https://godotshaders.com/snippet/rotate/

shader_type canvas_item;

uniform mat4 TRANSFORM;
uniform vec2 DEPTH;
uniform vec2 POSITION;
uniform float VIEW;
uniform bool REPEAT_X;
uniform bool REPEAT_Y;
uniform bool FLIP;
uniform bool ROTATING;
uniform float TEST_POSITION;

// this is used to rotate the map
uniform float ROTATE_ANGLE;

// function to rotate a point around a pivot point
vec2 rotate(vec2 view, vec2 pivot, float angle)
{

	mat2 rotation = mat2(vec2(cos(angle), -sin(angle)),
						vec2(sin(angle), cos(angle)));

	view -= pivot;
	view = (view) * rotation ;
	view += pivot;
	return view;
}


void fragment() {
	
	// Create the mode7 matrix. A workaround is used to modify the matrix's W column
	// because Godot's transforms are 3x4, not 4x4.
	mat4 mode_7_matrix = mat4(1.0);
	mode_7_matrix[0].w = DEPTH.x;
	mode_7_matrix[1].w = DEPTH.y;
	
	// Transform UV into [-1, 1] range
	vec2 uv = UV * 2.0 - vec2(1, 1);
	
	// Turn position into 4d vector
	vec4 map_position = vec4(uv, 1.0, 1.0);
	map_position = mode_7_matrix * map_position;
	map_position.xy = map_position.xy / map_position.w ;
	
	// Apply transformation to position
	float w = map_position.w;
	map_position.z = 0.0;
	map_position.w = 1.0 ;

	// Apply depth to position
	map_position = TRANSFORM * map_position;

	// divide position by w coordinate; this applies perspective
	// Set UV to position; transform its range to [0, 1]
	uv = (map_position.xy + vec2(1, 1)+POSITION);

	// if the player is rotating apply rotation
	if (ROTATING) {
		vec2 rotated_uv = rotate(uv,vec2(mode_7_matrix[3].x,mode_7_matrix[3].y), ROTATE_ANGLE);
		uv = rotated_uv;
	}
	// Determine if uv is in range or repeating pattern
	if (((uv.x > 0.0 && uv.x < 1.0) || REPEAT_X) && ((uv.y > 0.0 && uv.y < 1.0) || REPEAT_Y) && (w > 0.0 || FLIP)) {
		// Apply texture
		uv = mod(uv, 1.0);
		COLOR = texture(TEXTURE, uv);} 
	else {
		COLOR = vec4(0, 0, 0, 0);
	}
}