# Author: Sheshire | MIT Licensed.
extends ShyInput
class_name ShyInputInt


# Signals

# enums

# Constants

# Child Nodes References

# Exported Variables

@export var min_value := 0
@export var max_value := 100
@export var step := 1
@export var prefix := ""
@export var suffix := ""


# Properties

# Public Functions
func setup(_label:= "",_min := 0,_max := 100,_step := 1,_prefix := "",_suffix := "") -> void:
	super(_label)

	min_value = _min
	max_value = _max
	step = _step
	prefix = _prefix
	suffix = _suffix

# Logic


# ==================================
# Private Section
# ==================================
