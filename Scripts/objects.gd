class_name MinKontroll
extends Control

var musvar = 0
var point = Vector2()
onready var movescript = get_node("/root/Island3/Navigation2D")
onready var player = get_node("/root/Island3/Navigation2D/Character")
onready var camera = get_node("/root/Island3/Camera2D")
onready var inventoryscreen = get_node("../../Camera2D/inv button")
var camerapos = 0
var cameraxy = [Vector2(0,0), Vector2(1024,0), Vector2(02048,0), Vector2(0,600), Vector2(1024,600), Vector2(2048,600), Vector2(0,1200), Vector2(1024,1200), Vector2(2048,1200)]
var positions = []
var x = 0
var search = 0
var z = 0
#Items
var item_Ladder = 0
var item_Grogg = 0
var item_Poison = 0
var item_Parrot = 0
var Bag_of_dubloons = 0
var Map = 1
var Grej1 = 0
var Grej2 = 0
var Grej3 = 0
#Movement
func _input(event):
	if not event.is_action_pressed("click"):
		musvar = 0
		point = Vector2()
		return
	if event.is_action_pressed("click"):
		if musvar == 1:
			movescript.mus = 1
			movescript.get_interact_pos(point)
			point = Vector2()
		if musvar == 0:
			movescript.mus = 0
			movescript.get_interact_pos(point)
			point = Vector2()
			
func search_point():
	search = positions.find(player.position.floor())
#scenechange
func scenechange():
	if camerapos > 8:
		camerapos = 1
	if camerapos < 0:
		camerapos = 8
	camera.position = cameraxy[camerapos]
	z = search+x
	if search == 3:
		z = 17
	elif z > 17:
		z = 3
	elif z < 0:
		z = 0
	elif z == 0:
		z = 1
	print("z:")
	print(z)
	player.position = positions[z]
	movescript._update_navigation_path(positions[z], positions[z])
