extends Control

onready var fonster = get_node("cluewindow")
var varible  = 1

func _gui_input(event):
	if event.is_action_pressed("click") and varible == 1:
		fonster.show()
		varible = 2
	elif  event.is_action_pressed("click") and varible == 2:
		fonster.hide()
		varible = 1