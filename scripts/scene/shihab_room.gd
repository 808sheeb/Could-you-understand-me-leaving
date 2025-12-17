extends Node3D
@onready var cutter: CSGBox3D = $"Floors & Walls/shihab_wall_2/Cutter"
var keyIsActive = false

func _ready() -> void:
	GlobalMessenger.connect("KEY_WINTER", isActive)
	
func _process(_delta: float) -> void:
	if keyIsActive:
		cutter.visible = true
	else:
		cutter.visible = false

func isActive():
	keyIsActive = !keyIsActive
