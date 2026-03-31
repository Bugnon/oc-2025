@tool
extends Node3D
class_name Building

@export var floor_size = Vector3(10, 0.5, 5):
	set(x):
		floor_size = x
		create()

@export var floors = 4:
	set(x):
		floors = x
		create()
		
@export var use_collision = true:
	set(x):
		use_collision = x
		create()

@export var material: BaseMaterial3D


func _ready() -> void:
	create()
	
	
func create():
	for child in get_children():
		child.queue_free()
		
	var box
	for x in range(floors + 1):
		box = CSGBox3D.new()
		box.size = floor_size
		box.material = material
		box.use_collision = use_collision
		box.position.y = x * 4
		add_child(box)
		
	box = CSGBox3D.new()
	box.size = Vector3(1, floors*4, floor_size.z)
	box.material = material
	box.use_collision = use_collision
	box.position.y = floors / 2. * 4
	box.position.x = floor_size.x / 2
	add_child(box)
	
	box = CSGBox3D.new()
	box.size = Vector3(1, floors*4, floor_size.z)
	box.material = material
	box.use_collision = use_collision
	box.position.y = floors / 2. * 4
	box.position.x = -floor_size.x / 2
	add_child(box)
