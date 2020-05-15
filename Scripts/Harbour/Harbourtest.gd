extends MinKontroll

onready var intpoint = get_child(0)
onready var sprite = get_child(1)
onready var sendall = get_node("..")


func _gui_input(event):
	sendall.musvar = 1
	sendall.point = intpoint.global_position
	if event.is_action_pressed("click"):
		if player.position == intpoint.global_position:
			print("Grunkar")
			sprite.hide()
			sendall.item_Ladder = 1
			queue_free()