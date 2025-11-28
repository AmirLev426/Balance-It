extends Node2D

@onready var spawner: Button = $spawner

var movable_block = preload("res://scenes/movable_block.tscn")

func _on_area_2d_body_entered(_body: Node2D) -> void:
	call_deferred("queue_free")
	call_deferred("change_scene")
	LevelCore.lvl1_completed = true

func change_scene() -> void:
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")

func _on_spawner_pressed() -> void:
	inst(spawner.get_global_position())

func inst(pos): #on button press
	var instance = movable_block.instantiate()
	instance.position = pos
	add_child(instance)
