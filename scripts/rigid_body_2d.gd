extends RigidBody2D

var dragging = false
var of = Vector2(0,0)

@warning_ignore("unused_parameter") #ignore the 'delta' warning

func _process(delta):
	if dragging:
		global_position = get_global_mouse_position() - of

func _on_button_button_down() -> void:
	print("DOWN ", self)
	of = get_global_mouse_position() - global_position
	dragging = true
	freeze_mode = RigidBody2D.FREEZE_MODE_KINEMATIC
	freeze = true
	if rotation_degrees != 0:
		rotation_degrees = 0

func _on_button_button_up() -> void:
	print("UP ", self)
	dragging = false
	freeze = false
