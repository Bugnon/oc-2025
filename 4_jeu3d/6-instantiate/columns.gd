@tool
extends Node3D

@export var columns = 5:
	set(x):
		columns = x
		create()
		
@export var height = 4:
	set(x):
		height = x
		create()
		
@export var use_collision = true:
	set(x):
		use_collision = x
		create()

@export var material: StandardMaterial3D


func _ready():
	create()
	
func create():
	for child in get_children():
		child.queue_free()

	var box = CSGBox3D.new()
	box.size = Vector3(columns*2, 1, 1)
	box.material = material
	box.position.x = columns - 1
	box.use_collision = use_collision
	add_child(box)
	
	box = CSGBox3D.new()
	box.size = Vector3(columns*2, 1, 1)
	box.material = material
	box.position.x = columns - 1
	box.position.y = height
	box.use_collision = use_collision
	add_child(box)

	for x in range(columns):
		var cylinder = CSGCylinder3D.new()
		cylinder.height = height
		cylinder.material = material
		cylinder.use_collision = use_collision
		cylinder.sides = 16
		cylinder.position = Vector3(x*2, height/2., 0)
		cylinder.operation = CSGShape3D.OPERATION_UNION
		add_child(cylinder)
