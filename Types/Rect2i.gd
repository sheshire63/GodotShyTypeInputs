# Author: Sheshire | MIT Licensed.
extends ShyInputInt
class_name ShyRect2i


# Signals

# enums

# Constants

# Child Nodes References

# Exported Variables


@export var value := Rect2i(Vector2i.ZERO, Vector2i.ONE)


# Properties
var range_pos := ShyVector2i.new()
var range_size := ShyVector2i.new()
var range_end := ShyVector2i.new()
#todo add end point

# Public Functions

func get_value():
	return value


func set_value(new) -> void:
	_set_value(Rect2i(new))
	value_changed.emit(value)


func set_value_no_signal(new) -> void:
	_set_value(Rect2i(new))


# Logic
func _ready() -> void:
	super()

	box.add_child(range_pos)
	box.add_child(range_size)
	box.add_child(range_end)

	range_pos.setup("Position:", min_value, max_value, step, prefix, suffix)
	range_pos.value_changed.connect(_on_range_pos_changed)

	range_size.setup("Size:", min_value, max_value, step, prefix, suffix)
	range_size.value_changed.connect(_on_range_size_changed)

	range_end.setup("End:", min_value, max_value, step, prefix, suffix)
	range_end.value_changed.connect(_on_range_end_changed)

	_set_value(value)



func _on_range_pos_changed(new: Vector2i) -> void:
	set_value(Rect2i(new, value.size))


func _on_range_size_changed(new: Vector2i) -> void:
	set_value(Rect2i(value.position, new))


func _on_range_end_changed(new: Vector2i) -> void:
	set_value(Rect2i(value.position, new - value.position))

# ==================================
# Private Section
# ==================================

func _set_value(new: Rect2i) -> void:
	value = new

	range_pos.set_value_no_signal(new.position)
	range_size.set_value_no_signal(new.size)
	range_end.set_value_no_signal(new.end)
