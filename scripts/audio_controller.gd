extends Node

@export var mute: bool = false

func _ready() -> void:
	pass
	
func play_alarm() -> void:
	if not mute:
		$alarm.play()
		
func play_footsteps() -> void:
	if not mute:
		$walking_wood.play()
