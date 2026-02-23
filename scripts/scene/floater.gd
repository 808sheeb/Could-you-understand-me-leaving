extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var r = randi() % 2
	if r > 0.5:
		float_object_up()
		rotate_object_clock()
	else:
		float_object_down()
		rotate_object_counterclock()
		
func rand():
	var r = randi_range(45, 190)
	return(r)
	
func randTime():
	var r = randf_range(6.5, 13)
	return(r)
	
func randPosT():
	var r = randf_range(5, 8)
	return(r)
	
func randPosY():
	var r = randf_range(0.08, 0.16)
	return(r)

func rotate_object_clock():
	var tween = create_tween()
	tween.tween_property(self, "rotation_degrees", rotation_degrees+Vector3(rand(),rand(),rand()), randTime()).set_trans(Tween.TRANS_SINE)
	tween.tween_callback(rotate_object_counterclock)

func rotate_object_counterclock():
	var tween = create_tween()
	tween.tween_property(self, "rotation_degrees", rotation_degrees+(Vector3(rand(),rand(),rand()) * -1), randTime()).set_trans(Tween.TRANS_SINE)
	tween.tween_callback(rotate_object_clock)

func float_object_up():
	var tween = create_tween()
	tween.tween_property(self, "position", position+Vector3(0,randPosY(),0), randPosT()).set_trans(Tween.TRANS_QUAD)
	tween.tween_callback(float_object_down)
	
func float_object_down():
	var tween = create_tween()
	tween.tween_property(self, "position", position+Vector3(-0,-1 * randPosY(),-0), randPosT()).set_trans(Tween.TRANS_QUAD)
	tween.tween_callback(float_object_up)
