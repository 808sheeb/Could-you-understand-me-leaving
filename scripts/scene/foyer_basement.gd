extends Node3D

var GNOME = preload("uid://bklk2f6g44260").instantiate()

func _ready() -> void:
	#print(self)
	GNOME.transform.origin = Vector3(-6, -4.5, -18)
	GNOME.rotation_degrees = Vector3(0, 90, 0)
	GNOME.scale = Vector3(0.25, 0.25, 0.25)
	self.add_child(GNOME)
