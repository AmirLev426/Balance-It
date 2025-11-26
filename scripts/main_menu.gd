extends Control

@onready var main_buttons: VBoxContainer = $MainButtons
@onready var options: Panel = $Options
@onready var audio: Node2D = $Audio

func _ready() -> void:
	main_buttons.visible = true
	options.visible = false

func _on_start_pressed() -> void:
	audio.random_sfx()
	get_tree().change_scene_to_file("res://scenes/level1.tscn") #need to change to last level beat

func _on_select_level_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")

func _on_options_pressed() -> void:
	audio.random_sfx()
	main_buttons.visible = false
	options.visible = true

func _on_exit_pressed() -> void:
	audio.random_sfx()
	get_tree().quit()

func _on_back_pressed() -> void:
	_ready()
	audio.random_sfx()
