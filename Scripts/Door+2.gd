extends MinKontroll

onready var intpoint = get_child(0)
onready var sendpos = get_node("..")

func _ready():
	get_node("..").append(intpoint.global_position)

func _gui_input(event):
	sendpos.musvar = 1
	sendpos.point = intpoint.global_position
	if event.is_action_pressed("click"):
		if player.position == intpoint.global_position:
			sendpos.camerapos = sendpos.camerapos +2
			sendpos.x = 2
			sendpos.scenechange()