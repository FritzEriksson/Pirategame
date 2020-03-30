extends MinKontroll

onready var intpoint = get_child(0)
onready var sendpos = get_node("..")
onready var sprite = get_child(1)
onready var sendscore = get_node("../../../Camera2D/RichTextLabel")

func _gui_input(event):
	sendpos.musvar = 1
	sendpos.point = intpoint.global_position
	if event.is_action_pressed("click"):
		if player.position == intpoint.global_position:
			print("Funkar")
			sprite.hide()
			sendscore.score = sendscore.score + 1

			
			
