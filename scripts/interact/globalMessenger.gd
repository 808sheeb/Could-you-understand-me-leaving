extends Node

signal ALARM_TIMEOUT
signal ALARM_SNOOZE
signal KEY_WINTER
signal KEY_GNOME
signal KEY_GNOME_DOWN
signal KEY_GALLERY
signal KEY_ISLE
signal KEY_MERRY

var gnomeCount = 0

func _ready() -> void:
	connect("KEY_GNOME", gnomeUp)
	connect("KEY_GNOME_DOWN", gnomeDown)
	

func _process(_delta) -> void:
	if gnomeCount == 2:
		KEY_GALLERY.emit()
		gnomeCount = 0

func gnomeUp():
	gnomeCount += 1

func gnomeDown():
	gnomeCount -= 1
