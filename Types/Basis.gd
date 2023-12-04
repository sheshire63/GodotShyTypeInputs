# Author: Sheshire | MIT Licensed.
extends ShyInputFloat
class_name ShyBasis


# Signals

# enums

# Constants

# Child Nodes References

# Exported Variables

@export var value := Basis.IDENTITY

# Properties
var range_x := ShyVector3.new()
var range_y := ShyVector3.new()
var range_z := ShyVector3.new()

# Public Functions

func get_value():
	return value


func set_value(new) -> void:
	_set_value(Basis(new))
	value_changed.emit(value)


func set_value_no_signal(new) -> void:
	_set_value(Basis(new))


# Logic
func _ready() -> void:
	super()

	box.add_child(range_x)
	box.add_child(range_y)
	box.add_child(range_z)

	range_x.setup("X:", min_value, max_value, step, prefix, suffix)
	range_x.value_changed.connect(_on_range_x_changed)

	range_y.setup("Y:", min_value, max_value, step, prefix, suffix)
	range_y.value_changed.connect(_on_range_y_changed)

	range_z.setup("Z:", min_value, max_value, step, prefix, suffix)
	range_z.value_changed.connect(_on_range_z_changed)

	_set_value(value)


func _on_range_x_changed(new: Vector3) -> void:
	set_value(Basis(new, value.y, value.z))


func _on_range_y_changed(new: Vector3) -> void:
	set_value(Basis(value.x, new, value.z))


func _on_range_z_changed(new: Vector3) -> void:
	set_value(Basis(value.x, value.y, new))

# ==================================
# Private Section
# ==================================

func _set_value(new: Basis) -> void:
	value = new

	range_x.set_value_no_signal(value.x)
	range_y.set_value_no_signal(value.y)
	range_z.set_value_no_signal(value.z)
