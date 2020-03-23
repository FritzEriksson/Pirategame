extends Area2D

onready var quest_show = get_node("/root/Global")

func _ready():
	if quest_show.memory_things && quest_show.outside_memory > 0: #or < 0
		.hide()
		#insert functions of the inventory or quest items here. Such as continued quest line.