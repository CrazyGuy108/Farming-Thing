extends Node2D

const MAX_STAGE = 4
var _stage = 0

func _ready():
	_display_stage()

func get_stage():
	return _stage

func is_ready_for_harvest():
	return (_stage >= MAX_STAGE)

func update_stage():
	if (not is_ready_for_harvest()):
		_stage += 1
		_display_stage()

func reset_stage():
	_stage = 0
	_display_stage()

func _display_stage():
	get_node("stages").set_frame(_stage)
