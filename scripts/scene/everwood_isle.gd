extends Node3D
@onready var player: CharacterBody3D = $player
var spawn : Transform3D
@onready var timer: Timer = $Timer

func _ready() -> void:
	spawn = player.get_global_transform()
	

func _process(_delta) -> void:
	if Input.is_action_pressed("escape"):
		get_tree().quit()
	if Input.is_action_pressed("reset") and timer.time_left == 0:
		player.set_global_transform(spawn)

func _on_area_3d_body_entered(body: Node3D) -> void:
	if timer.time_left == 0:
		if body == player:
			resetPlayer()

func resetPlayer():
	timer.start()


func _on_timer_timeout() -> void:
	player.set_global_transform(spawn)
