extends Control

@onready var spawner: Button = $CanvasLayer/spawner
@onready var rng_spawner: Button = $CanvasLayer/rng_spawner

var movable_block = preload("res://scenes/movable_block.tscn")
var movable_block2 = preload("res://scenes/movable_block2.tscn")

var all_blocks = [movable_block, movable_block2]

#spawner
func _on_spawner_pressed() -> void:
	inst(spawner.get_global_position())

func inst(pos): #on button press
	var instance = movable_block.instantiate()
	instance.position = pos
	add_child(instance)

#random spawner
func _on_rng_spawner_pressed() -> void:
	inst_rng(rng_spawner.get_global_position())

func inst_rng(pos): #on button press
	var instance_rng = all_blocks.pick_random().instantiate()
	instance_rng.position = pos
	add_child(instance_rng)
