extends Node3D
var keyw = preload("uid://celmha118kao6").instantiate()

func _ready() -> void:
	print(self)
	keyw.transform.origin = Vector3(0,0.5,0)
	self.add_child(keyw)
	
