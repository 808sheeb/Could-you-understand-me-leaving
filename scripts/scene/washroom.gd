extends Node3D
var keyt = preload("uid://cjlsagu7xsrbm").instantiate()

func _ready() -> void:
	keyt.transform.origin = Vector3(-8.228,3.28,-18.314)
	keyt.rotation_degrees = Vector3(-73.6, 0, -11.1)
	self.add_child(keyt)
