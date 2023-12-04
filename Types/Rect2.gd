# Author: Sheshire | MIT Licensed.
extends ShyInputFloat
class_name ShyRect2


# Signals

# enums

# Constants

# Child Nodes References

# Exported Variables


@export var value := Rect2(Vector2.ZERO, Vector2.ONE)

# Properties
var range_pos := ShyVector2.new()
var range_size := ShyVector2.new()
var range_end := ShyVector2.new()
#todo add end point

# Public Functions

func get_value():
	return value


func set_value(new) -> void:
	_set_value(Rect2(new))
	value_changed.emit(value)


func set_value_no_signal(new) -> void:
	_set_value(Rect2(new))


# Logic
func _ready() -> void:
	super()

	range_pos.setup("Position", min_value, max_value, step, prefix, suffix)
	range_pos.value_changed.connect(_on_range_pos_changed)

	range_size.setup("Size", min_value, max_value, step, prefix, suffix)
	range_size.value_changed.connect(_on_range_size_changed)

	range_end.setup("End", min_value, max_value, step, prefix, suffix)
	range_end.value_changed.connect(_on_range_end_changed)

	box.add_child(range_pos)
	box.add_child(range_size)
	box.add_child(range_end)

	_set_value(value)



func _on_range_pos_changed(new: Vector2) -> void:
	set_value(Rect2(new, value.size))


func _on_range_size_changed(new: Vector2) -> void:
	set_value(Rect2(value.position, new))


func _on_range_end_changed(new: Vector2) -> void:
	set_value(Rect2(value.position, new - value.position))

# ==================================
# Private Section
# ==================================

func _set_value(new: Rect2) -> void:
	value = new

	range_pos.set_value_no_signal(new.position)
	range_size.set_value_no_signal(new.size)
	range_end.set_value_no_signal(new.end)
