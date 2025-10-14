extends Area3D

@export var ItemTypes : Array[ItemData] = []

var NearbyBodies : Array[InteractableItem]

func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("interact")):
		PickupRaycast()
		
func PickupNearestItem():
	var nearestItem : InteractableItem = null
	var nearestItemDistance : float = INF
	for item in NearbyBodies:
		if (item.global_position.distance_to(global_position) < nearestItemDistance):
			nearestItemDistance = item.global_position.distance_to(global_position)
			nearestItem = item
	if (nearestItem != null):
		nearestItem.queue_free()
		NearbyBodies.remove_at(NearbyBodies.find(nearestItem))
		var itemPrefab = nearestItem.scene_file_path
		for i in ItemTypes.size():
			if(ItemTypes[i].ItemModelPrefab != null and ItemTypes[i].ItemModelPrefab.resource_path == itemPrefab):
				print("Item id:" + str(i) + " Item Name:" + ItemTypes[i].ItemName)
				return
		printerr("Item not found")

func PickupRaycast():
	var interactRay: RayCast3D = %interact_ray
	if not interactRay.is_colliding():
		print("No item in raycast.")
		return

	var collider = interactRay.get_collider()
	if collider == null or not collider is InteractableItem:
		print("Raycast hit something that is not an item.")
	
	var hit_item : InteractableItem = collider
	hit_item.queue_free()
	
	if NearbyBodies.has(hit_item):
		NearbyBodies.remove_at(NearbyBodies.find(hit_item))
		
	var itemPrefab = hit_item.scene_file_path
	for i in ItemTypes.size():
		if ItemTypes[i].ItemModelPrefab != null and ItemTypes[i].ItemModelPrefab.resource_path == itemPrefab:
				print("Item id:" + str(i) + " Item Name:" + ItemTypes[i].ItemName)
				return
				
	printerr("Item not found")

func OnObjectEnteredArea(body: Node3D):
	if (body is InteractableItem):
		body.GainFocus()
		NearbyBodies.append(body)
		
func OnObjectExitedArea(body: Node3D):
	if (body is InteractableItem and NearbyBodies.has(body)):
		body.LoseFocus()
		NearbyBodies.remove_at(NearbyBodies.find(body))
