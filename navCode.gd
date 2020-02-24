extends Navigation2D

export(float) var character_speed = 300.0
var path = []

func _process(delta):
	var walk_distance = character_speed * delta
	move_along_path(walk_distance)



func _input(event):
	if not event.is_action_pressed("click"):
		return
	_update_navigation_path($Character.position, get_local_mouse_position())


func move_along_path(distance):
	var last_point = $Character.position
	while path.size():
		var distance_between_points = last_point.distance_to(path[0])
		if distance <= distance_between_points:
			$Character.position = last_point.linear_interpolate(path[0], distance / distance_between_points)
			return
		distance -= distance_between_points
		last_point = path[0]
		path.remove(0)
	$Character.position = last_point
	set_process(false)


func _update_navigation_path(start_position, end_position):
	path = get_simple_path(start_position, end_position, true)
	path.remove(0)
	set_process(true)