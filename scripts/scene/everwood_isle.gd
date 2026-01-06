extends Node3D
var spawn := Vector3(2336.8, 0.377, 14.342)
@onready var timer: Timer = $Timer
@onready var player: CharacterBody3D = $"../player"

func _ready() -> void:
	pass
	

func _process(_delta) -> void:
	pass

func _on_area_3d_body_entered(body: Node3D) -> void:
	if timer.time_left == 0:
		if body == player:
			resetPlayer()
			GlobalMessenger.UI_WATER.emit()

func resetPlayer():
	timer.start()


func _on_timer_timeout() -> void:
	player.set_position(spawn)
