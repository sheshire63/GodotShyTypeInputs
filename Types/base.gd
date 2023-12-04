# Author: Sheshire | MIT Licensed.
extends VBoxContainer
class_name ShyInput

## this base is for all input controls, for shared utility

# Signals
signal value_changed(value)

# enums

# Constants
const icon_hide: Texture = preload("res://addons/TypeInputs/GuiVisibilityHidden.svg")
const icon_show: Texture = preload("res://addons/TypeInputs/GuiVisibilityVisible.svg")

# Child Nodes References

# Exported Variables

@export var label_text := "":
	set(new):
		label_text = new
		label_button.text = new


# Properties

var box: BoxContainer
var label_button := Button.new()
var is_hidden := true

## set in ready before calling super
var use_single_line := false

# Public Functions


# virtual functions
func setup(label := "") -> void:
	label_text = label


func get_value():
	return null


func set_value(_new) -> void:
	value_changed.emit(_new)


func set_value_no_signal(new) -> void:
	pass


func toggle_show_box():
	is_hidden = !is_hidden
	box.visible = !is_hidden
	label_button.icon = icon_hide if is_hidden else icon_show


# Logic

func _ready() -> void:
	label_button.text = label_text
	label_button.flat = true
	label_button.custom_minimum_size = Vector2(128, 32)
	label_button.alignment = HORIZONTAL_ALIGNMENT_LEFT
	size_flags_horizontal = Control.SIZE_EXPAND_FILL

	if use_single_line:
		box = HBoxContainer.new()
		box.size_flags_horizontal = Control.SIZE_EXPAND_FILL

		box.add_child(label_button)
		add_child(box)
	else:
		var offset := MarginContainer.new()
		box = VBoxContainer.new()

		label_button.icon = icon_hide
		label_button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		label_button.pressed.connect(toggle_show_box)
		add_child(label_button)

		offset.add_child(box)
		box.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
		offset.add_theme_constant_override("margin_left", 16.0)

		offset.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		box.visible = false
		add_child(offset)


# ==================================
# Private Section
# ==================================


