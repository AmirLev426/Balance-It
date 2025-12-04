extends Camera2D

var max_x = 550
var max_y = 300
var min_x = -550
var min_y = -2000

func _physics_process(_delta):
	if Input.is_action_pressed("ui_up"):
		position.y -= 10

	if Input.is_action_pressed("ui_down"):
		position.y += 10

	if Input.is_action_pressed("ui_left"):
		position.x -= 10

	if Input.is_action_pressed("ui_right"):
		position.x += 10

	

	position.x = clamp(position.x, min_x, max_x)
	position.y = clamp(position.y, min_y, max_y)

func _input(event : InputEvent) -> void:
	if event.is_action_pressed("zoom"):
		if get_zoom() < Vector2(2, 2):
			set_zoom(get_zoom() + Vector2(0.1, 0.1))
		return

	if event.is_action_pressed("dezoom"):
		if get_zoom() > Vector2(1,1):
			set_zoom(get_zoom() - Vector2(0.1, 0.1))
		return

#	if Input.is_action_pressed("middle_mouse"):
#		var mouse_offset = event.position - get_global_mouse_position()
#		position -= mouse_offset 

#if limit reached alors pos = 0
#note : if movable_block is dragged, ignore the others
#if middle mouse alors move camera
