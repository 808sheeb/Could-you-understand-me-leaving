extends Panel
@onready var inv: HBoxContainer = $"../Inventory-HBOX"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	size = inv.get_size()
	position = inv.get_position()
