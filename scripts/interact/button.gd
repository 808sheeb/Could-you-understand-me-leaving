extends Interactable
var playback : AnimationNodeStateMachinePlayback


func _ready():
	playback = $AnimationTree.get("parameters/playback")

func _on_interacted(_body):
	playback.travel("Start")
	pass # Replace with function body.
