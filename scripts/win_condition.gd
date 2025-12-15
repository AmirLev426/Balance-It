extends Node2D

var timer_dict := {} # _body -> temps accumulé
var required_time := 3.0

func _process(delta):
	for body in timer_dict.keys():
		if body.linear_velocity.length() < 0.01:
			timer_dict[body] += delta
			if timer_dict[body] >= required_time:
				win(body)
		else:
			timer_dict[body] = 0.0

func _on_area_2d_body_entered(_body):
	timer_dict[_body] = 0.0
	print("body entered")

func _on_area_2d_body_exited(_body):
	timer_dict.erase(_body)
	print("body exited")

func win(_body):
	print("You won!")
	LevelCore.lvl1_completed = true
	call_deferred("queue_free")
	call_deferred("change_scene")

func change_scene():
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")
