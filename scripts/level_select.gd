extends Node2D

@onready var lvl_1_button: Button = %lvl1_button
@onready var lvl_2_button: Button = %lvl2_button
@onready var lvl_3_button: Button = %lvl3_button
@onready var lvl_2_completed: ColorRect = $lvl2_completed
@onready var lvl_3_completed: ColorRect = $lvl3_completed
@onready var lvl_1_locked: ColorRect = $lvl1_locked
@onready var lvl_2_locked: ColorRect = $lvl2_locked
@onready var lvl_3_locked: ColorRect = $lvl3_locked
@onready var lock_1: Sprite2D = $Lock1
@onready var lock_2: Sprite2D = $Lock2

func _ready() -> void:
	lvl_1_button.grab_focus()
	
	#LEVEL 1 CODE
	if LevelCore.lvl1_completed == true:
		lvl_1_locked.visible = false
		lock_1.visible = false

	if LevelCore.lvl1_completed == false:
		lvl_1_locked.visible = true
		lock_1.visible = true
		
	#LEVEL 2 CODE
	if LevelCore.lvl2_completed == true:
		lvl_2_locked.visible = false
		lock_2.visible = false

	if LevelCore.lvl2_completed == false:
		lvl_2_locked.visible = true
	
	#LEVEL 3 CODE
	if LevelCore.lvl3_completed == true:
		lvl_3_locked.visible = false

	if LevelCore.lvl3_completed == false:
		lvl_3_locked.visible = true


func _on_lvl_1_button_pressed() -> void:
	if LevelCore.lvl1_completed == false:
		get_tree().change_scene_to_file("res://scenes/level_1.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/level_1.tscn")


func _on_lvl_2_button_pressed() -> void:
	if LevelCore.lvl1_completed == false:
		pass #null 
	if LevelCore.lvl1_completed == true:
		get_tree().change_scene_to_file("res://scenes/level_2.tscn")


func _on_lvl_3_button_pressed() -> void:
	if LevelCore.lvl2_completed == false:
		pass
	if LevelCore.lvl2_completed == true:
		get_tree().change_scene_to_file("res://scenes/level_3.tscn")


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
