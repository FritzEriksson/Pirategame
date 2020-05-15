extends Node2D

onready var sprite = get_node("Sprite")
onready var text_label = get_node("")
onready var get_item = get_node("../../item_class")
var dialog_over = false
var dia_index = 1

export (String, FILE, "*.json") var dialogue_file_path : String
var dpath = "data/dialogue.json" #str(get_item.items["1"]["item_path"])
var dialogue : Dictionary

