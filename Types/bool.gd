# Author: Sheshire | MIT Licensed.
extends ShyInput
class_name ShyBool


# Signals

# enums

# Constants

# Child Nodes References

# Exported Variables
@export var texture_true: Texture
@export var texture_false: Texture
@export var text_true := "True"
@export var text_false := "False"

@export var value := true
## for more fine control you can add a button as a child and link it here

# Properties
var button := Button.new()

# Public Functions

func get_value():
	return value


func set_value(new) -> void:
	_set_value(bool(new))
	value_changed.emit(value)


func set_value_no_signal(new) -> void:
	_set_value(bool(new))

# Logic
func _ready() -> void:
	use_single_line = true
	super()

	button.toggle_mode = true
	button.toggled.connect(_on_button_pressed)
	button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	button.size_flags_vertical = Control.SIZE_EXPAND_FILL
	box.add_child(button)

	_set_value(value)



func _on_button_pressed(pressed: bool) -> void:
	set_value(pressed)


# ==================================
# Private Section
# ==================================

func _set_value(new: bool) -> void:
	value = new
	button.set_pressed_no_signal(value)
	if value:
		button.text = text_true
		button.icon = texture_true
	else:
		button.text = text_false
		button.icon = texture_false
