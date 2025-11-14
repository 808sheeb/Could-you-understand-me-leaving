extends Interactable

var playback : AnimationNodeStateMachinePlayback
var is_pushed := false

func _ready():
	playback = $AnimationTree.get("parameters/playback")
	

func _on_interacted(_body):
	playback.travel("Start")
	# pass # Replace with function body.
