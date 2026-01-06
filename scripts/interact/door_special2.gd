extends Interactable
var toggle = false
@onready var playback : AnimationPlayer = $"../AnimationPlayer2"

func _ready() -> void:
	prompt_message = "Open Door"
	

func _process(_delta) -> void:
	if toggle:
		prompt_message = "Close Door"
	elif !toggle:
		prompt_message = "Open Door"

func _on_interacted(_body):
		toggle = !toggle
		if toggle:
			playback.play("Open")
		if !toggle:
			playback.play("Close")
