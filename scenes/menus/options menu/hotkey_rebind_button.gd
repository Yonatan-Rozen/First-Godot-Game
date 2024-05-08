class_name HotkeyRebindButton
extends Control

@onready var action_label = %ActionLabel as Label
@onready var select_key_button = %SelectKeyButton

@export var action_name : String = "move_left"

func _ready():
	set_process_unhandled_key_input(false)
	set_action_name()
	set_text_for_key()

func set_action_name() -> void:
	action_label.text = "Unassigned"

	match action_name:
		"move_left":
			action_label.text = "Move Left"
		"move_right":
			action_label.text = "Move Right"
		"jump":
			action_label.text = "Jump"

func set_text_for_key() -> void:
	var action_events = InputMap.action_get_events(action_name)
	var action_event = action_events[0]
	var action_keycode = OS.get_keycode_string(action_event.physical_keycode)
	
	print(action_keycode)
	select_key_button.text = "%s" % action_keycode


func _on_select_key_button_toggled(toggled_on):
	if toggled_on:
		select_key_button.text = "Press any key..."
		set_process_unhandled_key_input(toggled_on)
		toggle_all_other_buttons_to(false)
	else:
		toggle_all_other_buttons_to(true)
		set_text_for_key()
		
func toggle_all_other_buttons_to(toggle) -> void:
	for i in get_tree().get_nodes_in_group("hotkey_button"):
		if i.action_name != self.action_name:
			i.select_key_button.toggle_mode = toggle
			i.set_process_unhandled_key_input(false)

func _unhandled_key_input(event):
	rebind_action_key(event)
	select_key_button.button_pressed = false

func rebind_action_key(event) -> void:
	InputMap.action_erase_events(action_name)
	InputMap.action_add_event(action_name,event)
	set_process_unhandled_key_input(false)
	set_text_for_key()
	set_action_name()
