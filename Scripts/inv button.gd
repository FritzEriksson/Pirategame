extends Node2D

onready var inventory = get_node("../../Map/objects")
onready var invfonster = get_child(0)
var varible  = 1
#"Inventory = I"
func _process(delta):
	checkinventory()
	if Input.is_action_just_released("Inventory") && varible == 1:
		invfonster.show()
		varible = 2
	elif Input.is_action_just_released("Inventory") && varible == 2:
		invfonster.hide()
		varible = 1

func checkinventory():
	if inventory.item_Ladder == 1:
		invfonster.get_child(0).show()
	elif inventory.item_Ladder == 0:
		invfonster.get_child(0).hide()
	if inventory.item_Grogg == 1:
		invfonster.get_child(1).show()
	elif inventory.item_Grogg == 0:
		invfonster.get_child(1).hide()
