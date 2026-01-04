extends Interactable

var keyBody = null
var keyParent = null
var pickedUp = false
var objT = null
var gnomeBody = null

func _ready() -> void:
	GlobalMessenger.connect('ALARM_SNOOZE', reset_key)
	
	
func reset_key():
	if pickedUp:
		keyParent.add_child(self)
		self.set_transform(objT)
		pickedUp = false

func _on_interacted(_body):
	keyBody = _body.get_parent_node_3d()
	keyParent = keyBody.get_parent_node_3d()
	getobjtransform()
	keyBody.remove_child(self)
	pickedUp = true
	GlobalMessenger.KEY_GNOME.emit()

func getobjtransform():
	objT = keyBody.get_transform()
	print(objT)
