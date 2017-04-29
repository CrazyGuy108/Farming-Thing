extends Node2D

const MAX_MONEY = 100
var _money = 0

func _ready():
	_display()
	for soil in get_node("soils").get_children():
		soil.connect("plant_harvested", self, "_update_money", [10])

func _update_money(amount):
	_money = min(_money + amount, MAX_MONEY)
	_display()

func _display():
	get_node("money").set_text("Money: $" + str(_money))
