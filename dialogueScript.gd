extends Area2D

onready var sprite = get_node("Sprite")
onready var movement = get_node("../../player")
onready var text_label = get_node("../RichTextLabel")
onready var get_item = get_node("../../item_class")
var dialog_over = false
var dia_index = 1

export (String, FILE, "*.json") var dialogue_file_path : String
var dpath = "data/dialogue.json" #str(get_item.items["1"]["item_path"])
var dialogue : Dictionary

func _ready():
	sprite.show()
	text_label.hide()
	dialogue = load_dialogue(dpath)
	
func _input(event):
	if Input.is_action_just_pressed("ui_accept") && dialog_over == true && movement.entered_key == true:
		get_item.items["1"]["is_picked"] = true
		sprite.hide()

func interact() -> void:
	
	if dialog_over == false:
		if dialogue.size() > 1:
			text_label.visible == false
			movement.SPEED = 0
			text_label.show()
		
			if dia_index != dialogue.size() + 1:
				text_label.text = dialogue[str(dia_index)]["text"]
				dia_index += 1
			else:
				dia_index = 1
				text_label.hide()
				movement.SPEED = 200
				dialog_over = true
		
		elif dialogue.size() == 1: 
			text_label.visible == false
			movement.SPEED = 0
			text_label.show()
			text_label.text = dialogue["1"]["text"]
			
		else:
			text_label.hide()
			movement.SPEED = 200
			dialog_over = true



func load_dialogue(file_path) -> Dictionary:

	var file = File.new()
	assert(file.file_exists(file_path))
	
	file.open(file_path, file.READ)
	var dialogue = parse_json(file.get_as_text())
	assert(dialogue.size() > 0)
	return dialogue 
