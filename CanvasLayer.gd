extends CanvasLayer

signal use_joystick_direction

func _input(event):
	if event is InputEventScreenTouch or event is InputEventScreenDrag:
		if $TouchScreenButton.is_pressed():
			var move_vector = calculate_move_vector(event.position.x)
			emit_signal("use_joystick_direction",use_joystick_direction)
			
func calculate_move_vector(event_position_x):
	var texture_center_x = $TouchScreenButton.position.x + 280.5
	return Vector2(event_position_x - texture_center_x, 0).normalized()

