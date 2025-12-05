extends Button

@onready var game_world = get_tree().get_current_scene().get_node("GameWorld")
@onready var spawner: Button = $"."


var movable_block = preload("res://scenes/movable_block.tscn")

func _on_pressed() -> void:
	var pos = game_world.get_global_transform().affine_inverse() * get_viewport().get_mouse_position()
	inst(pos)
	print(pos)

func inst(pos):
	var instance = movable_block.instantiate()
	instance.position = pos
	game_world.add_child(instance)
