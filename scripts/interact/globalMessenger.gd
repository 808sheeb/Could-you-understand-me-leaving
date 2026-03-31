extends Node

signal ALARM_TIMEOUT
signal ALARM_SNOOZE
signal KEY_WINTER
signal KEY_GNOME
signal KEY_GNOME_DOWN
signal KEY_GNOME_LOCK
signal KEY_GNOME_RESET
signal KEY_VILLAGE
signal KEY_MEADOW
signal INTERACTED

signal SPAWN_KEYS

signal UI_ITEM
signal UI_DOOR
signal UI_WORLD
signal UI_WATER

var gnomeCount = 0

func _ready() -> void:
	connect("KEY_GNOME", gnomeUp)
	connect("KEY_GNOME_DOWN", gnomeDown)
	

func _process(_delta) -> void:
	if gnomeCount == 4:
		KEY_GNOME_LOCK.emit()
		gnomeCount = 0

func gnomeUp():
	if gnomeCount < 4:
		gnomeCount += 1

func gnomeDown():
	if gnomeCount > 0:
		gnomeCount -= 1
