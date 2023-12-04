# Author: Sheshire | MIT Licensed.
extends ShyInputInt
class_name ShyVector4i


# Signals

# enums

# Constants

# Child Nodes References

# Exported Variables


@export var value := Vector4i.ZERO

# Properties
var range_x := ShyInt.new()
var range_y := ShyInt.new()
var range_z := ShyInt.new()
var range_w := ShyInt.new()

# Public Functions

func get_value():
	return value


func set_value(new) -> void:
	_set_value(Vector4i(new))
	value_changed.emit(value)


func set_value_no_signal(new) -> void:
	_set_value(Vector4i(new))


# Logic
func _ready() -> void:
	super()

	box.add_child(range_x)
	box.add_child(range_y)
	box.add_child(range_z)
	box.add_child(range_w)

	range_x.setup("X:", min_value, max_value, step, prefix, suffix)
	range_x.value_changed.connect(_on_range_x_changed)

	range_y.setup("Y:", min_value, max_value, step, prefix, suffix)
	range_y.value_changed.connect(_on_range_y_changed)

	range_z.setup("Z:", min_value, max_value, step, prefix, suffix)
	range_z.value_changed.connect(_on_range_z_changed)

	range_w.setup("W:", min_value, max_value, step, prefix, suffix)
	range_w.value_changed.connect(_on_range_w_changed)

	_set_value(value)


func _on_range_x_changed(new: int) -> void:
	set_value(Vector4i(new, value.y, value.z, value.w))


func _on_range_y_changed(new: int) -> void:
	set_value(Vector4i(value.x, new, value.z, value.w))


func _on_range_z_changed(new: int) -> void:
	set_value(Vector4i(value.x, value.y, new, value.w))


func _on_range_w_changed(new: int) -> void:
	set_value(Vector4i(value.x, value.y, value.z, new))

# ==================================
# Private Section
# ==================================

func _set_value(new: Vector4i) -> void:
	value = new

	range_x.set_value_no_signal(value.x)
	range_y.set_value_no_signal(value.y)
	range_z.set_value_no_signal(value.z)
	range_w.set_value_no_signal(value.w)
