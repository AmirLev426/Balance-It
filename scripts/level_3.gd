extends Node2D

func _on_area_2d_body_entered(_body: Node2D) -> void:
	call_deferred("queue_free")
	call_deferred("change_scene")
	LevelCore.lvl3_completed = true

func change_scene() -> void:
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")
