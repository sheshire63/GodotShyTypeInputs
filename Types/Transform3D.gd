# Author: Sheshire | MIT Licensed.
extends ShyInputFloat
class_name ShyTransform3D


# Signals

# enums

# Constants

# Child Nodes References

# Exported Variables


@export var value := Transform3D.IDENTITY

# Properties
var range_basis := ShyBasis.new()
var range_origin := ShyVector3.new()
#todo add end point

# Public Functions

func get_value():
	return value


func set_value(new) -> void:
	_set_value(Transform3D(new))
	value_changed.emit(value)


func set_value_no_signal(new) -> void:
	_set_value(Transform3D(new))


# Logic
func _ready() -> void:
	super()

	box.add_child(range_basis)
	box.add_child(range_origin)

	range_basis.setup("Basis:", min_value, max_value, step, prefix, suffix)
	range_basis.value_changed.connect(_on_range_basis_changed)

	range_origin.setup("Origin:", min_value, max_value, step, prefix, suffix)
	range_origin.value_changed.connect(_on_range_origin_changed)

	_set_value(value)



func _on_range_basis_changed(new: Basis) -> void:
	set_value(Transform3D(new, value.origin))


func _on_range_origin_changed(new: Vector3) -> void:
	set_value(Transform3D(value.basis, new))

# ==================================
# Private Section
# ==================================

func _set_value(new: Transform3D) -> void:
	value = new

	range_basis.set_value_no_signal(new.basis)
	range_origin.set_value_no_signal(new.origin)
