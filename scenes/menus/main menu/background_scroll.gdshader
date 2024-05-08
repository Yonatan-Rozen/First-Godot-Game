shader_type canvas_item;

uniform float speedX = 0.01;
uniform float speedY = 0.05;

void vertex() {
	UV.x += TIME * speedX;
	UV.y += TIME * speedY;
}