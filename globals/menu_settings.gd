extends Node

signal color_blind_mode_changed(value : bool)


var color_blind_mode : bool = true : 
	set(value):
		if value == color_blind_mode:
			return
		color_blind_mode = value
		color_blind_mode_changed.emit(value)
