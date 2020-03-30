extends Sprite

onready var show_captain = get_node("/root/Global")
onready var fokinlabel = get_node("RichTextLabel")
func _ready():

	if show_captain.outside_memory && show_captain.memory_things > 0:
		fokinlabel.show()