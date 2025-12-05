extends Button

@onready var rng_spawner: Button = $"."

var movable_block = preload("res://scenes/movable_block.tscn")
var movable_block2 = preload("res://scenes/movable_block2.tscn")
var all_blocks = [movable_block, movable_block2]

func _on_pressed() -> void:
	inst_rng(rng_spawner.get_global_position())

func inst_rng(pos): #on button press
	var instance_rng = all_blocks.pick_random().instantiate()
	instance_rng.position = pos
	add_child(instance_rng)
