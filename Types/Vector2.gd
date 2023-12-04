# Author: Sheshire | MIT Licensed.
extends ShyInputFloat
class_name ShyVector2


# Signals

# enums

# Constants

# Child Nodes References

# Exported Variables


@export var value := Vector2.ZERO

# Properties
var range_x := ShyFloat.new()
var range_y := ShyFloat.new()

# Public Functions

func get_value():
	return value


func set_value(new) -> void:
	_set_value(Vector2(new))
	value_changed.emit(value)


func set_value_no_signal(new) -> void:
	_set_value(Vector2(new))


# Logic
func _ready() -> void:
	super()

	range_x.setup("X:", min_value, max_value, step, prefix, suffix)
	range_x.value_changed.connect(_on_range_x_changed)

	range_y.setup("Y:", min_value, max_value, step, prefix, suffix)
	range_y.value_changed.connect(_on_range_y_changed)

	box.add_child(range_x)
	box.add_child(range_y)

	_set_value(value)


func _on_range_x_changed(new: float) -> void:
	set_value(Vector2(new, value.y))


func _on_range_y_changed(new: float) -> void:
	set_value(Vector2(value.x, new))

# ==================================
# Private Section
# ==================================

func _set_value(new: Vector2) -> void:
	value = new

	range_x.set_value_no_signal(value.x)
	range_y.set_value_no_signal(value.y)
