# Author: Sheshire | MIT Licensed.
extends ShyInputInt
class_name ShyVector3i


# Signals

# enums

# Constants

# Child Nodes References

# Exported Variables


@export var value := Vector3i.ZERO

# Properties
var range_x := ShyInt.new()
var range_y := ShyInt.new()
var range_z := ShyInt.new()

# Public Functions

func get_value():
	return value


func set_value(new) -> void:
	_set_value(Vector3i(new))
	value_changed.emit(value)


func set_value_no_signal(new) -> void:
	_set_value(Vector3i(new))


# Logic
func _ready() -> void:
	super()

	range_x.setup("X:", min_value, max_value, step, prefix, suffix)
	range_x.value_changed.connect(_on_range_x_changed)

	range_y.setup("Y:", min_value, max_value, step, prefix, suffix)
	range_y.value_changed.connect(_on_range_y_changed)

	range_z.setup("Z:", min_value, max_value, step, prefix, suffix)
	range_z.value_changed.connect(_on_range_z_changed)

	box.add_child(range_x)
	box.add_child(range_y)
	box.add_child(range_z)

	_set_value(value)


func _on_range_x_changed(new: int) -> void:
	set_value(Vector3i(new, value.y, value.z))


func _on_range_y_changed(new: int) -> void:
	set_value(Vector3i(value.x, new, value.z))


func _on_range_z_changed(new: int) -> void:
	set_value(Vector3i(value.x, value.y, new))

# ==================================
# Private Section
# ==================================

func _set_value(new: Vector3i) -> void:
	value = new

	range_x.set_value_no_signal(value.x)
	range_y.set_value_no_signal(value.y)
	range_z.set_value_no_signal(value.z)
