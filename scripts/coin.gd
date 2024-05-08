extends Area2D

@onready var game_manager = %GameManager
@onready var animation_player = $AnimationPlayer
@onready var overlay = %Overlay

func _on_body_entered(_body):
	overlay.add_point()
	game_manager.add_point()
	animation_player.play("pickup")
