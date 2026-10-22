extends Node3D

var villagePortalActive = false
@onready var village_portal: Portal3D = $main_house/HousePortalVillage
@onready var player: CharacterBody3D = $player
@onready var village_particles: GPUParticles3D = $main_house/VillageParticles
@onready var town: Node3D = $Town


func _ready() -> void:
	village_particles.visible = false
	town.visible = false
	
	#on alarm reset, do this
	GlobalMessenger.connect('ALARM_SNOOZE', resetPortal)
	
	#on key pickup, do this
	GlobalMessenger.connect("KEY_VILLAGE", villagePortal)
	
	GlobalMessenger.connect("RESET", gameReset)
	
func _process(_delta) -> void:
	#DEBUG PLAYER POSITION
	#print(player.get_position())
	pass

func villagePortal():
	villagePortalActive = true
	village_portal.visible = true
	village_particles.visible = true
	village_portal.activate()
	town.visible = true

func resetPortal():
	#VILLAGE
	villagePortalActive = false
	village_portal.visible = false
	village_particles.visible = false
	village_portal.deactivate()
	town.visible = false

func gameReset():
	get_tree().reload_current_scene()
