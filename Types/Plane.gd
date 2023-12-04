# Author: Sheshire | MIT Licensed.
extends ShyInputFloat
class_name ShyPlane


# Signals

# enums

# Constants

# Child Nodes References

# Exported Variables


@export var value := Plane.PLANE_XY

# Properties
var range_x := ShyFloat.new()
var range_y := ShyFloat.new()
var range_z := ShyFloat.new()
var range_d := ShyFloat.new()
var normal := ShyVector3.new()

# Public Functions

func get_value():
	return value


func set_value(new) -> void:
	_set_value(Plane(new))
	value_changed.emit(value)


func set_value_no_signal(new) -> void:
	_set_value(Plane(new))


# Logic
func _ready() -> void:
	super()

	range_x.setup("X:", min_value, max_value, step, prefix, suffix)
	range_x.value_changed.connect(_on_range_x_changed)

	range_y.setup("Y:", min_value, max_value, step, prefix, suffix)
	range_y.value_changed.connect(_on_range_y_changed)

	range_z.setup("Z:", min_value, max_value, step, prefix, suffix)
	range_z.value_changed.connect(_on_range_z_changed)

	range_d.setup("D:", min_value, max_value, step, prefix, suffix)
	range_d.value_changed.connect(_on_range_d_changed)

	normal.setup("Normal:", min_value, max_value, step, prefix, suffix)
	normal.value_changed.connect(_on_normal_changed)

	box.add_child(range_x)
	box.add_child(range_y)
	box.add_child(range_z)
	box.add_child(range_d)
	box.add_child(normal)

	_set_value(value)




func _on_range_x_changed(new: float) -> void:
	set_value(Plane(new, value.y, value.z, value.d))


func _on_range_y_changed(new: float) -> void:
	set_value(Plane(value.x, new, value.z, value.d))


func _on_range_z_changed(new: float) -> void:
	set_value(Plane(value.x, value.y, new, value.d))


func _on_range_d_changed(new: float) -> void:
	set_value(Plane(value.x, value.y, value.z, new))


func _on_normal_changed(new: Vector3) -> void:
	set_value(Plane(new, value.d))

# ==================================
# Private Section
# ==================================

func _set_value(new: Plane) -> void:
	value = new

	range_x.set_value_no_signal(value.x)
	range_y.set_value_no_signal(value.y)
	range_z.set_value_no_signal(value.z)
	range_d.set_value_no_signal(value.d)
	normal.set_value_no_signal(value.normal)
