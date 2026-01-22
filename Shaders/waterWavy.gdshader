shader_type canvas_item;

void vertex() {
	VERTEX.y += 20.0* sin(VERTEX.x * 10.0 + TIME);
}
