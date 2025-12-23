extends Node3D
var lerp_toggle = true
var posY
var posX
var posZ
var newposY
@export var speed = 0.5
@export var range : float = 0.0
var maxY
var minY
var t = 0.0

func _ready() -> void:
	posY = self.get_position().y
	posX = self.get_position().x
	posZ = self.get_position().z
	minY = posY - range
	maxY = posY + range

func _process(delta: float) -> void:
	posY = self.get_position().y
	posY_lerp(delta)

func posY_lerp(delta) -> void:
	#flips the lerp operations based on if the pos Y has past it's limit
	if t > 1:
		#print("toggle")
		lerp_toggle = false
	if t < 0:
		#print("toggle")
		lerp_toggle = true

	# lerp weight, goes forward or back based on where the pos Y is
	if lerp_toggle:
		t += delta * speed
	elif !lerp_toggle:
		t -= delta * speed
	newposY = lerpf(minY, maxY, t)
	
	# DEBUG
	#print("lerp coeff: " + str(t))
	#print("Max: " + str(maxY) + "Min:" + str(minY))
	#print(newposY)
	var newPos = Vector3(posX, newposY, posZ)
	self.set_position(newPos)
