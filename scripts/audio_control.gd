extends HSlider

@export var audio_bus_name: String

var audio_bus_id

func _ready():
	audio_bus_id = AudioServer.get_bus_index(audio_bus_name)

func _on_value_changed(bus_value: float) -> void:
	print(bus_value)
	var db = linear_to_db(bus_value)
	AudioServer.set_bus_volume_db(audio_bus_id, db)
