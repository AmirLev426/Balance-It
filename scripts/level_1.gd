extends Node2D

@onready var spawner: Button = $spawner
@onready var rng_spawner: Button = $rng_spawner
@onready var movable_block2D = $MovableBlock

var movable_block = preload("res://scenes/movable_block.tscn")
var movable_block2 = preload("res://scenes/movable_block2.tscn")

var all_blocks = [movable_block, movable_block2]

func _on_area_2d_body_entered(_body: Node2D) -> void:
	print("body entered")
	await get_tree().create_timer(3.0).timeout
	if _body.linear_velocity.length() < 1:
		print("body not moving")
		LevelCore.lvl1_completed = true
		call_deferred("queue_free")
		call_deferred("change_scene")

func _on_area_2d_body_exited(_body: Node2D):
	print("body exited")

func change_scene() -> void:
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")

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
