extends Node

@export var menu_sfx: AudioStreamPlayer2D
@export var menu_sfx2: AudioStreamPlayer2D

func random_sfx():
	var players = [$MenuSFX, $MenuSFX2]
	var p = players.pick_random()
	p.play()
