extends Interactable
var toggle = false
@export var playback : AnimationPlayer

func _ready() -> void:
	prompt_message = "Open Door"
	pass
	

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
	pass # Replace with function body.
