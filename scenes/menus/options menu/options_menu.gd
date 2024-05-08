class_name OptionsMenu
extends Control

@onready var back_button = %BackButton as Button

signal back_to_main_menu

func _ready():
	back_button.button_down.connect(on_back_pressed)
	set_process(false)
	
func on_back_pressed() -> void:
	back_to_main_menu.emit()
	set_process(false)
