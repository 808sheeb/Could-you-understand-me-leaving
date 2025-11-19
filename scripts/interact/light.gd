extends Node3D
var snoozed = true
var t = 0.0
var speed = 3
var emissionA = 0.0
var emissionB = 2.3
var e = 2.5
var light_toggle = true;
@onready var oLight: OmniLight3D = $OmniLight3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	oLight.set_param(Light3D.PARAM_ENERGY, e)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if snoozed:
		oLight.set_color(Color.WHITE)
		oLight.set_param(Light3D.PARAM_ENERGY,2.5)
	elif !snoozed:
		oLight.set_color(Color.RED)
		oLight.set_param(Light3D.PARAM_ENERGY,2.5) 
		emission_lerp(delta)

func _on_alarm_timeout() -> void:
	snoozed = !snoozed
	print("alarm is going off")
	pass # Replace with function body.

func _on_gui_snoozed() -> void:
	snoozed = !snoozed
	print("alarm is snoozed")
	pass # Replace with function body.

func emission_lerp(delta) -> void:
	#flips the lerp operations based on if the light emission has maxxed out
	if e > 2.5 and light_toggle:
		light_toggle = false
	elif e < 0 and !light_toggle:
		light_toggle = true

	# lerp weight, goes forward or back based on where the light emission is
	if light_toggle:
		t += delta * speed
	elif !light_toggle:
		t -= delta * speed
	
	e = lerpf(emissionA, emissionB, t)
	#print(e)
	oLight.set_param(Light3D.PARAM_ENERGY, e)
