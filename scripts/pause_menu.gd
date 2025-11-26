extends Control

@onready var audio: Node2D = $Audio

var is_paused = false

func _ready():
	$AnimationPlayer.play("RESET")
	add_to_group("movable")

func resume():
	$AnimationPlayer.play_backwards("blur")
	is_paused = false

func pause():
	$AnimationPlayer.play("blur")
	is_paused = true

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
	audio.random_sfx()
	get_tree().reload_current_scene()
	resume()

func _on_change_level_pressed() -> void:
	audio.random_sfx()
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")

func _on_main_menu_pressed() -> void:
	audio.random_sfx()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _process(_delta):
	testEsc()
