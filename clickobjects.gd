extends Area2D
onready var outsidemem = get_node("/root/Global")

func _ready():
	if outsidemem.outside_memory > 0:
		.hide()
	
	
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()


#ange funktion av knapp här
func on_click():
	outsidemem.outside_memory = 1;
	print (outsidemem.outside_memory);
	.hide()