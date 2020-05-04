class_name MinKontroll
extends Control

var musvar = 0
var point = Vector2()
onready var movescript = get_node("/root/Island3/Navigation2D")
onready var player = get_node("/root/Island3/Navigation2D/Character")
onready var camera = get_node("/root/Island3/Camera2D")
var camerapos = 0
var cameraxy = [Vector2(0,0), Vector2(1024,0), Vector2(02048,0), Vector2(0,600), Vector2(1024,600), Vector2(2048,600), Vector2(0,1200), Vector2(1024,1200), Vector2(2048,1200)]
var positions = []
var x = 0
var search = 0
var saved = Vector2()
var z = search+x

func _input(event):
	if not event.is_action_pressed("click"):
		musvar = 0
		point = Vector2()
		return
	if event.is_action_pressed("click"):
		if musvar == 1:
			movescript.mus = 1
			movescript.get_interact_pos(point)
			saved = point
			point = Vector2()
		if musvar == 0:
			movescript.mus = 0
			movescript.get_interact_pos(point)
			saved = point
			point = Vector2()
			
func search_point():
	search = positions.bsearch(saved)
	print("search:")
	print(search)

func scenechange():
	if camerapos > 8:
		camerapos = 1
	if camerapos < 0:
		camerapos = 8
	camera.position = cameraxy[camerapos]
	if z == 3:
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
	