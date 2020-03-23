extends Area2D
onready var memoryglobal = get_node("/root/Global")


func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()


#ange funktion av knapp här
func on_click():
	memoryglobal.memory_things = 1;
	print (memoryglobal.memory_things);
	.hide()