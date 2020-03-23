extends KinematicBody2D
var local = 0
#ar playerpos = (Vector2())
onready var globalposition = get_node("/root/Global")
export (int) var speed = 50
var velocity = Vector2()
var player
var current_pos = position
func on_scene_entered():
	pass
	
func _ready():
	print("Jag startar")
	set_global_position(Global.get_back)
	print(globalposition.memory_things)


func get_input():
    velocity = Vector2()
    if Input.is_action_pressed('ui_right'):
        velocity.x += 1
       # print(Global.get_back)
    if Input.is_action_pressed('ui_left'):
        velocity.x -= 1
        #set_global_position(Global.get_back)
    if Input.is_action_pressed('ui_down'):
        velocity.y += 0
    if Input.is_action_pressed("ui_up"):
        velocity.y -= 0
    velocity = velocity.normalized() * speed
    

func _physics_process(delta):
	get_input()
	#if Global.been_in_scene == 1:
		#set_global_position(Global.get_back)
		#Global.been_in_scene = 0
	velocity = move_and_slide(velocity)
	if local > 0 && Input.is_action_pressed("ui_up"):
		Global.get_back = self.global_position
		#print(position)
		get_tree().change_scene("res://tavern.tscn")

func _on_Doorscene_body_entered(body):
	#playerpos = get_global_position()
	#print(playerpos)
	local = 1
	print(local)
func _on_Doorscene_body_exited(body):
	
	#print(playerset)
	local = 0
	print(local)






