extends Node3D
@onready var ptimer: Timer = $PetTimer
@onready var mtimer: Timer = $MeowTimer
@onready var meow_0: AudioStreamPlayer3D = $meow_0
@onready var meow_1: AudioStreamPlayer3D = $meow_1
@onready var meow_2: AudioStreamPlayer3D = $meow_2
@onready var meow_3: AudioStreamPlayer3D = $meow_3
@onready var purring: AudioStreamPlayer3D = $purring

var hasMeowed := false

func _ready() -> void:
	pass
	
func _process(_delta) -> void:
	pass
	
func meowChecker():
	#print("free to meow again")
	hasMeowed = false

func isPetting(_body):
	if !hasMeowed:
		var r = randi_range(0,3)
		if r == 0:
			meow_0.play()
		elif r == 1:
			meow_1.play()
		elif r == 2:
			meow_2.play()
		elif r == 3:
			meow_3.play()
		hasMeowed = true
		ptimer.start()
	elif hasMeowed:
		purring.play()

func rand_meow():
	mtimer.wait_time = randf_range(55, 120)
	var r = randi_range(0,3)
	if r == 0:
		meow_0.play()
	elif r == 1:
		meow_1.play()
	elif r == 2:
		meow_2.play()
	elif r == 3:
		meow_3.play()
