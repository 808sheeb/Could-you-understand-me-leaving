extends Node3D

class_name InteractableItem

@export var ItemHightlightMesh : MeshInstance3D

func GainFocus():
	ItemHightlightMesh.visible = true
	
func LoseFocus():
	ItemHightlightMesh.visible = false
	
