extends Node
onready var playerpos1 = get_node("/root/Kinematicbody2D/Kinematicbody2D")
signal pos_spelare

func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://bootybae.tscn")
		emit_signal("pos_spelare")
