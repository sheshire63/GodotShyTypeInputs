# Author: Sheshire | MIT Licensed.
extends ShyInputFloat
class_name ShyFloat


# Signals

# enums

# Constants

# Child Nodes References

# Exported Variables


@export var value := 0.0

var range := SpinBox.new()
var slider := HSlider.new()

# Properties

# Public Functions

func get_value():
	return value


func set_value(new) -> void:
	_set_value(float(new))
	value_changed.emit(value)


func set_value_no_signal(new) -> void:
	_set_value(float(new))

# Logic
func _ready() -> void:
	use_single_line = true
	super()
	range.min_value = min_value
	range.max_value = max_value
	range.step = step
	range.prefix = prefix
	range.suffix = suffix

	slider.min_value = min_value
	slider.max_value = max_value
	slider.step = step


	range.value_changed.connect(_set_value)
	range.size_flags_vertical = Control.SIZE_EXPAND_FILL
	box.add_child(range)
	range.visible = use_box

	slider.value_changed.connect(_set_value)
	slider.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	slider.size_flags_vertical = Control.SIZE_EXPAND_FILL
	box.add_child(slider)
	slider.visible = use_slider





# ==================================
# Private Section
# ==================================

func _set_value(new: float) -> void:
	value = new

	if range:
		range.set_value_no_signal(value)
	if slider:
		slider.set_value_no_signal(value)
