extends Node3D

@export var isWalking : bool = false
@onready var ap: AnimationPlayer = $cat2/AnimationPlayer

func _ready() -> void:
	pass
	
func _process(_delta) -> void:
	if isWalking:
		ap.play("Walk")
	elif !isWalking:
		ap.play("Idle_02")
