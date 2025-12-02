extends RigidBody2D

var dragging = false
var of = Vector2(0,0)

@onready var movable_block: RigidBody2D = $"."
@onready var sprite_2d: Sprite2D = $Sprite2D

@warning_ignore("unused_parameter") #ignore the 'delta' warning

func _process(delta):
	if dragging:
		global_position = get_global_mouse_position() - of
		sprite_2d.z_index = 10

func _on_button_button_down() -> void:
	print("DOWN ", self)
	of = get_global_mouse_position() - global_position
	dragging = true
	freeze_mode = RigidBody2D.FREEZE_MODE_KINEMATIC
	movable_block.collision_layer = 2
	sprite_2d.z_index = 10
	
	freeze = true
	if rotation_degrees != 0:
		rotation_degrees = 0

func _on_button_button_up() -> void:
	movable_block.collision_layer = 1
	print("UP ", self)
	dragging = false
	await get_tree().create_timer(0.1).timeout
	freeze = false
	sprite_2d.z_index = 0

#if obj dragged est à pos de obj 2,3,... alors peut pas poser et if poser alors revenir a pos initiale
