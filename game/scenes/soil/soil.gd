extends Area2D

signal plant_harvested
onready var _plant = get_node("plant")
var _time = 0

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	_time += delta
	if (_time >= 1.0):
		_time -= 1.0
		_plant.update_stage()

func _input_event(viewport, event, shape_idx):
	if (event.type == InputEvent.MOUSE_BUTTON):
		# todo: if seed selected and no plant already, plant it
		# else if plant at last stage, harvest and (todo) notify
		if (_plant.is_ready_for_harvest()):
			_plant.reset_stage()
			emit_signal("plant_harvested")
			_time = 0
