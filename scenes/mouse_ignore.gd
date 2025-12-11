extends Button

@onready var pause_menu: Control = $"../../../.."

func _process(_delta):
	if pause_menu.is_paused == false:
		mouse_filter = Button.MOUSE_FILTER_IGNORE
	else:
		mouse_filter = Button.MOUSE_FILTER_STOP
