@tool
extends Node3D


@export var steps = 5:
	set(x):
		steps = x
		create()
		pass
	
@export var step_size = Vector3(2, 1, 4):
	set(x):
		step_size = x
		create()
		
@export var step_delta = Vector3(0, 0, 0):
	set(x):
		step_delta = x
		create()
		
@export_range(0, 360, 1, "radians_as_degrees") var angle: float:
	set(x):
		angle = x
		create()
		
@export var show_node = false:
	set(x):
		show_node = x
		create()
		
@export var material: BaseMaterial3D


func _ready():
	create()
	
func create():
	for child in get_children():
		child.queue_free()
		
	for x in range(steps):
		pass
		var box = CSGBox3D.new()
		#var box = MeshInstance3D
		box.size = step_size
		box.material = material
		box.rotation.y = x * angle
		
		box.position = Vector3(x*(step_size.x + step_delta.x), x*(step_size.y + step_delta.y), 0)
		box.operation = CSGShape3D.OPERATION_UNION
		add_child(box)
		if show_node:
			box.owner = get_tree().edited_scene_root
