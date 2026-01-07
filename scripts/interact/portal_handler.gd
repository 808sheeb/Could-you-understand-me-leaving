extends Node3D

var winterPortalActive =  false
var islePortalActive = false
@onready var winter_portal: Portal3D = $main_house/HousePortalWinter
@onready var winter_border: Node3D = $main_house/WinterBorder
@onready var isle_border: Node3D = $main_house/EverwoodsBorder
@onready var isle_portal: Portal3D = $main_house/HousePortalEverwoods
@onready var player: CharacterBody3D = $player

func _ready() -> void:
	winter_border.visible = false
	isle_border.visible = false
	#on alarm reset, do this
	GlobalMessenger.connect('ALARM_SNOOZE', resetPortal)
	
	#on key pickup, do this
	GlobalMessenger.connect("KEY_WINTER", winterPortal)
	GlobalMessenger.connect("KEY_ISLE", islePortal)
	
func _process(_delta) -> void:
	#DEBUG PLAYER POSITION
	#print(player.get_position())
	pass

func winterPortal():
	winterPortalActive = true
	winter_border.visible = true
	winter_portal.activate()
	
func islePortal():
	islePortalActive = true
	isle_border.visible = true
	isle_portal.activate()
	
func resetPortal():
	#WINTER
	winterPortalActive = false
	winter_border.visible = false
	winter_portal.deactivate()
	#ISLE
	islePortalActive = false
	isle_border.visible = false
	isle_portal.deactivate()
