extends Control

func _gui_input(event):
	if event.is_action_pressed("click"):
		print("Du löste det!")