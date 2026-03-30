@tool
extends Node3D

@export var size = Vector3(5, 3, 4):
	set(x):
		size = x
		create()
		
@export var window = Rect2(2, 1, 2, 3):
	set(x):
		window = x
		create()

		
@export var d = 0.5:
	set(x):
		d = x
		create()

@export var material = Resource

@export var export = false:
	set(x):
		export = x
		create()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("_ready")
	print("size:", size)
	print("size2:", size - Vector3(d, d, d))
	print("size3:", size / 2)
	
	create()
	
func create():
	for child in get_children():
		child.queue_free()
		
	var room = CSGBox3D.new()
	room.size = size
	room.material = material
	room.operation = CSGShape3D.OPERATION_UNION
	add_child(room)
	if export:
		room.owner = get_tree().edited_scene_root
	
	var room2 = CSGBox3D.new()
	room2.material = material
	room2.size = size - Vector3(2*d, 2*d, d)
	room2.position.z = d/2
	room2.operation = CSGShape3D.OPERATION_SUBTRACTION
	room.add_child(room2)
	if export:
		room2.owner = get_tree().edited_scene_root
	
	var win = CSGBox3D.new()
	win.material = material
	win.size.x = window.size.x 
	win.size.y = window.size.y
	win.size.z = size.z
	win.position.x = window.position.x
	win.position.y = window.position.y
	
	win.operation = CSGShape3D.OPERATION_SUBTRACTION
	room.add_child(win)
	
	if export:
		win.owner = get_tree().edited_scene_root
