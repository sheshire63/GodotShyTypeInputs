# Author: Sheshire | MIT Licensed.
extends ShyInput
class_name ShyInputFloat


# Signals

# enums

# Constants

# Child Nodes References

# Exported Variables



@export var min_value := 0.0
@export var max_value := 1.0
@export var step := 0.1
@export var prefix := ""
@export var suffix := ""
@export var use_slider := true
@export var use_box:= true

# Properties

# Public Functions
func setup(_label:= "",_min := 0.0,_max := 1.0,_step := 0.01,_prefix := "",_suffix := "") -> void:
	super(_label)

	min_value = _min
	max_value = _max
	step = _step
	prefix = _prefix
	suffix = _suffix

# ==================================
# Private Section
# ==================================
