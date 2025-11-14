extends Node3D
@onready var alarm: Node2D = $"../../../GUI"
@onready var light: OmniLight3D = $"."

var snooze = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func is_snoozed() -> void:
	snooze = !snooze
	print("snooze is " + snooze)
