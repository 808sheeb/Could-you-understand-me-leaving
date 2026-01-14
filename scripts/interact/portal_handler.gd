extends Node3D

var winterPortalActive =  false
var islePortalActive = false
var galleryPortalActive = false
var villagePortalActive = false
@onready var winter_portal: Portal3D = $main_house/HousePortalWinter
@onready var winter_border: Node3D = $main_house/WinterBorder
@onready var isle_border: Node3D = $main_house/EverwoodsBorder
@onready var isle_portal: Portal3D = $main_house/HousePortalEverwoods
@onready var village_portal: Portal3D = $main_house/HousePortalVillage
@onready var player: CharacterBody3D = $player
@onready var isle_particles: GPUParticles3D = $main_house/IsleParticles
@onready var village_particles: GPUParticles3D = $main_house/VillageParticles
@onready var winter_particles: GPUParticles3D = $main_house/WinterParticles


func _ready() -> void:
	winter_border.visible = false
	isle_border.visible = false
	village_particles.visible = false
	isle_particles.visible = false
	winter_particles.visible = false
	#on alarm reset, do this
	GlobalMessenger.connect('ALARM_SNOOZE', resetPortal)
	
	#on key pickup, do this
	GlobalMessenger.connect("KEY_WINTER", winterPortal)
	GlobalMessenger.connect("KEY_ISLE", islePortal)
	GlobalMessenger.connect("KEY_GALLERY", galleryPortal)
	GlobalMessenger.connect("KEY_VILLAGE", villagePortal)
	
func _process(_delta) -> void:
	#DEBUG PLAYER POSITION
	#print(player.get_position())
	pass

func winterPortal():
	winterPortalActive = true
	winter_border.visible = true
	winter_particles.visible = true
	winter_portal.activate()
	
func islePortal():
	islePortalActive = true
	isle_border.visible = true
	isle_particles.visible = true
	isle_portal.activate()
	
func galleryPortal():
	galleryPortalActive = true
	

func villagePortal():
	villagePortalActive = true
	village_portal.visible = true
	village_particles.visible = true
	village_portal.activate()

func resetPortal():
	#WINTER
	winterPortalActive = false
	winter_border.visible = false
	winter_particles.visible = false
	winter_portal.deactivate()
	#ISLE
	islePortalActive = false
	isle_border.visible = false
	isle_particles.visible = false
	isle_portal.deactivate()
	#VILLAGE
	villagePortalActive = false
	village_portal.visible = false
	village_particles.visible = false
	village_portal.deactivate()
