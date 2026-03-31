@tool
extends Node3D

@export var steps = 5:
	set(x):
		steps = x
		create()
	
@export var size = Vector3(4, 0.5, 3):
	set(x):
		size = x
		create()
		
@export var step_delta = Vector3(0, 0, 0):
	set(x):
		step_delta = x
		create()

@export var show_node = false:
	set(x):
		show_node = x
		create()
		
@export var material: BaseMaterial3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create()

func create():
	for child in get_children():
		child.free()
		
	var box = CSGBox3D.new()
	box.size = size
	box.material = material
	box.use_collision = true
	add_child(box)
	if show_node:
		box.owner = get_tree().edited_scene_root

	for i in range(1, steps):
		var box2 = box.duplicate()
		box2.position.x  += randfn(3, 3)
		box2.position.z  += randfn(1, 1)
		add_child(box2)
		if show_node:
			box2.owner = get_tree().edited_scene_root
