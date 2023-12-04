# Author: Sheshire | MIT Licensed.
extends ShyInputFloat
class_name ShyTransform2D


# Signals

# enums

# Constants

# Child Nodes References

# Exported Variables


@export var value := Transform2D.IDENTITY

# Properties
var range_x := ShyVector2.new()
var range_y := ShyVector2.new()
var range_origin := ShyVector2.new()
#todo add end point

# Public Functions

func get_value():
	return value


func set_value(new) -> void:
	_set_value(Transform2D(new))
	value_changed.emit(value)


func set_value_no_signal(new) -> void:
	_set_value(Transform2D(new))


# Logic
func _ready() -> void:
	super()

	box.add_child(range_x)
	box.add_child(range_y)
	box.add_child(range_origin)

	range_x.setup("X:", min_value, max_value, step, prefix, suffix)
	range_x.value_changed.connect(_on_range_pos_changed)

	range_y.setup("Y:", min_value, max_value, step, prefix, suffix)
	range_y.value_changed.connect(_on_range_size_changed)

	range_origin.setup("Origin:", min_value, max_value, step, prefix, suffix)
	range_origin.value_changed.connect(_on_range_end_changed)

	_set_value(value)



func _on_range_pos_changed(new: Vector2) -> void:
	set_value(Transform2D(new, value.y, value.origin))


func _on_range_size_changed(new: Vector2) -> void:
	set_value(Transform2D(value.x, new, value.origin))


func _on_range_end_changed(new: Vector2) -> void:
	set_value(Transform2D(value.x, value.y, new))

# ==================================
# Private Section
# ==================================

func _set_value(new: Transform2D) -> void:
	value = new

	range_x.set_value_no_signal(new.x)
	range_y.set_value_no_signal(new.y)
	range_origin.set_value_no_signal(new.origin)
