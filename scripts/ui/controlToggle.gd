extends Control
@onready var toggle_group: Control = $ToggleGroup
var toggler = false
var controllerLayout = false
@onready var keyboard: Control = $ToggleGroup/Keyboard
@onready var controller: Control = $ToggleGroup/Controller
@onready var keeb_toggle: TextureRect = $"../Alt/keeb_toggle"
@onready var xbox_toggle: TextureRect = $"../Alt/xbox_toggle"
@onready var cross_hair: TextureRect = $"../CrossHair"
@onready var prompt: Label = $"../../head/InteractRay/prompt"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	toggle_group.visible = true
	keyboard.visible = true
	controller.visible = false
	keeb_toggle.visible = true
	xbox_toggle.visible = false
	cross_hair.visible = true
	prompt.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	if toggler:
		toggle_group.visible = true
		prompt.visible = false
		cross_hair.visible = false
	elif !toggler:
		toggle_group.visible = false
		prompt.visible = true
		cross_hair.visible = true

	if controllerLayout:
		xbox_toggle.visible = true
		keeb_toggle.visible = false
		controller.visible = true
		keyboard.visible = false
	else:
		xbox_toggle.visible = false
		keeb_toggle.visible = true
		controller.visible = false
		keyboard.visible = true

func _input(_event) -> void:
	if Input.is_action_just_pressed("toggle"):
		toggler = !toggler
		#print(toggler)
		
	if Input.is_action_just_pressed("layout"):
		controllerLayout = !controllerLayout
