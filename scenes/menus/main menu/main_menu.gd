class_name MainMenu
extends Control

@onready var start_button = %StartButton as Button
@onready var options_button = %OptionsButton as Button
@onready var quit_button = %QuitButton as Button
@onready var options_menu = $OptionsMenu as OptionsMenu
@onready var margin_container = $MarginContainer as MarginContainer

@export var start_level = preload("res://scenes/gameplay/levels/game.tscn") as PackedScene

func _ready():
	handle_connection_signals()

# start the first level
func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(start_level)
	
# handle game options
func on_options_pressed() -> void:
	margin_container.visible = false
	options_menu.set_process(true)
	options_menu.visible = true
	
# quit the game
func on_quit_pressed() -> void:
	get_tree().quit()

func on_back_to_menu() -> void:
	margin_container.visible = true
	options_menu.visible = false

### connect
func handle_connection_signals() -> void:
	start_button.button_down.connect(on_start_pressed)
	options_button.button_down.connect(on_options_pressed)
	quit_button.button_down.connect(on_quit_pressed)
	options_menu.back_to_main_menu.connect(on_back_to_menu)
