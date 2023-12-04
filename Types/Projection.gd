# Author: Sheshire | MIT Licensed.
extends ShyInputFloat
class_name ShyProjection


# Signals

# enums

# Constants

# Child Nodes References

# Exported Variables


@export var value := Projection.ZERO

# Properties
var range_x := ShyVector4.new()
var range_y := ShyVector4.new()
var range_z := ShyVector4.new()
var range_w := ShyVector4.new()

# Public Functions

func get_value():
	return value


func set_value(new) -> void:
	_set_value(Projection(new))
	value_changed.emit(value)


func set_value_no_signal(new) -> void:
	_set_value(Projection(new))


# Logic
func _ready() -> void:
	super()
	range_x.setup("X:", min_value, max_value, step, prefix, suffix)
	range_x.value_changed.connect(_on_range_x_changed)

	range_y.setup("Y:", min_value, max_value, step, prefix, suffix)
	range_y.value_changed.connect(_on_range_y_changed)

	range_z.setup("Z:", min_value, max_value, step, prefix, suffix)
	range_z.value_changed.connect(_on_range_z_changed)

	range_w.setup("W:", min_value, max_value, step, prefix, suffix)
	range_w.value_changed.connect(_on_range_w_changed)


	box.add_child(range_x)
	box.add_child(range_y)
	box.add_child(range_z)
	box.add_child(range_w)

	_set_value(value)


func _on_range_x_changed(new: Vector4) -> void:
	set_value(Projection(new, value.y, value.z, value.w))


func _on_range_y_changed(new: Vector4) -> void:
	set_value(Projection(value.x, new, value.z, value.w))


func _on_range_z_changed(new: Vector4) -> void:
	set_value(Projection(value.x, value.y, new, value.w))


func _on_range_w_changed(new: Vector4) -> void:
	set_value(Projection(value.x, value.y, value.z, new))

# ==================================
# Private Section
# ==================================

func _set_value(new: Projection) -> void:
	value = new

	range_x.set_value_no_signal(value.x)
	range_y.set_value_no_signal(value.y)
	range_z.set_value_no_signal(value.z)
	range_w.set_value_no_signal(value.w)
