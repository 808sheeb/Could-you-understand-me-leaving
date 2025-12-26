extends Node3D
var SPEED = 0.005
var y = get_global_rotation().y
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	y = SPEED + y
	set_global_rotation(Vector3(0, y, 0))
