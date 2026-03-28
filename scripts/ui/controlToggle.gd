extends Control
@onready var toggle_group: Control = $ToggleGroup
var toggler = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	toggle_group.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	if toggler:
		toggle_group.visible = true
	elif !toggler:
		toggle_group.visible = false

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("toggle"):
		toggler = !toggler
		print(toggler)
