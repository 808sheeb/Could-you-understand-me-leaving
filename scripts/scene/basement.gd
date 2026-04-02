extends Node3D
@onready var pbg: Node3D = $PortalBevel_Gallery
@onready var bc: CSGBox3D = $basement_doorRight/basement_cutter
@onready var gallery_timer: Timer = $GalleryTimer

var keyIsActive := false

func _ready() -> void:
	pbg.visible = false
	bc.visible = false
	GlobalMessenger.connect("KEY_GNOME_LOCK", activeToggle)

func _process(_delta) -> void:
	if keyIsActive:
		bc.visible = true
		pbg.visible = true
	else:
		bc.visible = false
		pbg.visible = false
	
func activeToggle():
	keyIsActive = true
	gallery_timer.start()

func galleryClosed():
	keyIsActive = false
	GlobalMessenger.KEY_GNOME_RESET.emit()
	print("gallery closed")
