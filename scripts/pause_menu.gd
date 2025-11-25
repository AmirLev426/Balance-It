extends Control
@onready var audio: Node2D = $Audio
func _ready():
	$AnimationPlayer.play("RESET")
	add_to_group("movable")

func resume():
	$AnimationPlayer.play_backwards("blur")

func pause():
	$AnimationPlayer.play("blur")

func testEsc():
	if Input.is_action_just_pressed("escape"):
		pause()
	elif Input.is_action_just_pressed("escape"):
		resume()

func _on_resume_pressed() -> void:
	audio.random_sfx()
	resume()

func _on_restart_pressed() -> void:
	audio.random_sfx()
	resume()
	get_tree().reload_current_scene()

func _on_quit_pressed() -> void:
	audio.random_sfx()
	get_tree().quit()

func _process(delta):
	testEsc()
