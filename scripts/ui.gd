extends Control

@onready var spawner: Button = $CanvasLayer/spawner
@onready var rng_spawner: Button = $CanvasLayer/rng_spawner
@onready var level_1: Node2D = $".."   # le monde 2D

var cercle := preload("res://scenes/blocks/cercle.tscn")
var cube := preload("res://scenes/blocks/cube.tscn")
var right_triangle := preload("res://scenes/blocks/right_triangle.tscn")
var all_blocks := [cercle, cube, right_triangle]

func _on_spawner_pressed():
	spawn_from_button(spawner, cube)

func _on_rng_spawner_pressed():
	spawn_from_button(rng_spawner, all_blocks.pick_random())

func spawn_from_button(btn: Button, scene: PackedScene):
	# position écran du bouton (CanvasLayer)
	var pos_screen: Vector2 = btn.get_global_position()

	# conversion écran → monde (Camera2D incluse)
	var pos_world: Vector2 = get_viewport().get_canvas_transform().affine_inverse() * pos_screen

	var instance = scene.instantiate()
	instance.position = pos_world
	level_1.add_child(instance)
