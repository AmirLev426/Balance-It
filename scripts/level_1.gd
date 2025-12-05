extends Node2D

var movable_block = preload("res://scenes/movable_block.tscn")
var movable_block2 = preload("res://scenes/movable_block2.tscn")

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
