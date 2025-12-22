extends Node3D
var keyw = preload("uid://celmha118kao6").instantiate()

func _ready() -> void:
	#print(self)
	keyw.transform.origin = Vector3(-1.164,0.939,0.336)
	keyw.rotation_degrees = Vector3(0, 56.5, 0)
	self.add_child(keyw)
	
