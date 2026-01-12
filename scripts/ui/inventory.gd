extends Control

var keysCollected := 0
@onready var xbox: TextureRect = $"Inventory-HBOX/Xbox"
@onready var merry: TextureRect = $"Inventory-HBOX/Merry"
@onready var billi: TextureRect = $"Inventory-HBOX/Billi"
@onready var gnome: TextureRect = $"Inventory-HBOX/Gnome"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	GlobalMessenger.connect("KEY_VOID", goingVoid)
	GlobalMessenger.connect("KEY_WINTER", winterKey)
	GlobalMessenger.connect("KEY_ISLE", isleKey)
	GlobalMessenger.connect("KEY_GALLERY", gnomeKey)
	GlobalMessenger.connect("ALARM_SNOOZE", keyReturn)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	if keysCollected > 0:
		visible = true

func winterKey():
	keysCollected += 1
	xbox.visible = true
	
func goingVoid():
	keysCollected += 1
	merry.visible = true

func isleKey():
	keysCollected += 1
	billi.visible = true

func gnomeKey():
	keysCollected += 1
	gnome.visible = true

func keyReturn():
	if xbox.visible:
		xbox.visible = false
	if merry.visible:
		merry.visible = false
	if billi.visible:
		billi.visible = false
	if gnome.visible:
		gnome.visible = false
	visible = false
	keysCollected = 0
