# Author: Sheshire | MIT Licensed.
extends ShyInput
class_name ShyColor


# Signals

# enums

# Constants

# Child Nodes References

# Exported Variables


@export var value := Color.WHITE

var color_select := ColorPickerButton.new()

# Properties

# Public Functions

func get_value():
	return value


func set_value(new) -> void:
	_set_value(Color(new))
	value_changed.emit(value)


func set_value_no_signal(new) -> void:
	_set_value(Color(new))

# Logic
func _ready() -> void:
	use_single_line = true
	super()
	color_select.color_changed.connect(_set_value)
	color_select.size_flags_vertical = Control.SIZE_EXPAND_FILL
	color_select.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	box.add_child(color_select)




# ==================================
# Private Section
# ==================================

func _set_value(new: Color) -> void:
	value = new

	color_select.color = new #todo check that this does not cause recursion loop
