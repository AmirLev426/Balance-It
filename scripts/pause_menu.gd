extends Control

@onready var audio: Node2D = $Audio
@onready var canvas_layer: CanvasLayer = $CanvasLayer
var is_paused = false

func _ready():
	$AnimationPlayer.play("RESET")
	add_to_group("movable")

func resume():
	$AnimationPlayer.play_backwards("blur")
	is_paused = false
	get_tree().paused = false
	canvas_layer.layer = 0

func pause():
	$AnimationPlayer.play("blur")
	is_paused = true
	get_tree().paused = true
	canvas_layer.layer = 100

func testEsc():
	if Input.is_action_just_pressed("escape"):
		if !is_paused:
			pause()
		else:
			resume()

func _on_resume_pressed() -> void:
	audio.random_sfx()
	resume()

func _on_restart_pressed() -> void:
	resume()
	audio.random_sfx()
	get_tree().reload_current_scene()

func _on_change_level_pressed() -> void:
	resume()
	audio.random_sfx()
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")

func _on_main_menu_pressed() -> void:
	resume()
	audio.random_sfx()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _process(_delta):
	testEsc()
