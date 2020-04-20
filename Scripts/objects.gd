class_name MinKontroll
extends Control

var musvar = 0
var point = Vector2()
onready var movescript = get_node("/root/Island3/Navigation2D")
onready var player = get_node("/root/Island3/Navigation2D/Character")
onready var camera = get_node("/root/Island3/Camera2D")
var camerapos = 0
var playerspawn = 0
var cameraxy = [Vector2(0,0), Vector2(1024,0), Vector2(02048,0), Vector2(0,600), Vector2(1024,600), Vector2(2048,600), Vector2(0,1200), Vector2(1024,1200), Vector2(2048,1200)]
var playerspawnpoint = [Vector2(512,460),Vector2(1536, 300), Vector2(2560,300), Vector2(512,900), Vector2(1536,900), Vector2(2560,900), Vector2(512,1500), Vector2(1536,1500), Vector2(2560,1500)]



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
			
		
func scenechange():
	if camerapos > 8:
		camerapos = 1
	if camerapos < 0:
		camerapos = 8
	camera.position = cameraxy[camerapos]
	player.position = playerspawnpoint[camerapos]
	movescript._update_navigation_path(playerspawnpoint[camerapos], playerspawnpoint[camerapos])
	