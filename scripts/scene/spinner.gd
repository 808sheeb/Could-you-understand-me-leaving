extends CSGCylinder3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotateFull()
	
func rotateFull():
	var tween = create_tween()
	tween.tween_property(self, "rotation_degrees", rotation_degrees+Vector3(0,360,0), 20)
