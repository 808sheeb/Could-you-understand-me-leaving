extends Node3D
var isPlayerInside = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_region_body_entered(body: Node3D) -> void:
	isPlayerInside = true
	print(isPlayerInside)
	pass # Replace with function body.


func _on_button_region_body_exited(body: Node3D) -> void:
	isPlayerInside = false
	print(isPlayerInside)
	pass # Replace with function body.
