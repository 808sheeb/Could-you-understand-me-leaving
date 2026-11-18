extends Control

var keysCollected := 0
@onready var xbox: TextureRect = $"Inventory-HBOX/Xbox"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	GlobalMessenger.connect("KEY_XBOX", xboxKey)
	GlobalMessenger.connect("ALARM_SNOOZE", keyReturn)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	if keysCollected > 0:
		visible = true
	else:
		visible = false

func xboxKey():
	keysCollected += 1
	xbox.visible = true

func keyReturn():
	if xbox.visible:
		xbox.visible = false
