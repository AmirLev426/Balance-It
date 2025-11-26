extends Node2D

@onready var audio: Node2D = $Audio

func _ready():
	pass


func _on_area_2d_body_entered(_body: Node2D) -> void:
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")
	LevelCore.lvl2_completed = true
