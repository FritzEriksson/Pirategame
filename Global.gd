extends Node
var get_back = (Vector2 (137.849, 551.589))
var player
#Inside tavern
var memory_things = 0
#outside in bootybae
var outside_memory = 0



var current_scene = null

func _ready():
    var root = get_tree().get_root()
    current_scene = root.get_child(root.get_child_count() - 1)

func goto_scene(path):
	"res://bootybae.tscn"
	call_deferred("_deferred_goto_scene","res://bootybae.tscn")