extends Interactable

var keyBody = null
var keyParent = null
var pickedUp = false
var objT = null
var objS = Vector3(0.3, 0.3, 0.3)
var objR = null
var objP = null

func _ready() -> void:
	GlobalMessenger.connect('ALARM_SNOOZE', reset_key)
		
	
func reset_key():
	if pickedUp:
		keyParent.add_child(self)
		#var loc = Vector3(objT.origin.x, objT.origin.y, objT.origin.z)
		#print(loc)
		self.set_global_position(objP)
		self.set_scale(objS)
		self.set_rotation(objR)
		pickedUp = false
		GlobalMessenger.KEY_GNOME_DOWN.emit()

func _on_interacted(_body):
	keyBody = _body.get_parent_node_3d()
	if keyParent == null:
		keyParent = keyBody.get_parent_node_3d()
	print(keyParent)
	if objP == null:
		objP = keyBody.get_global_position()
	if objR == null:
		objR = keyBody.get_rotation()
	print(objP)
	print(objR)
	keyBody.remove_child(self)
	pickedUp = true
	GlobalMessenger.KEY_GNOME.emit()
