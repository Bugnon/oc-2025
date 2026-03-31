@tool
extends Node3D
class_name Matrix

@export var repeat = Vector3i(3, 1, 1):
	set(x):
		repeat = x
		create()
	
@export var step = Vector3(1, 1, 1):
	set(x):
		step = x
		create()
		
@export var random = Vector3(0.1, 0, 0.1):
	set(x):
		random = x
		create()

@export var scene: PackedScene:
	set(x):
		scene = x
		create()

@export var show_node = false:
	set(x):
		show_node = x
		create()


func _ready():
	create()
	
	
func create():
	if not is_node_ready() or not is_inside_tree():
		return
	
	if scene == null:
		for child in get_children():
			child.free()
		return
		
	for child in get_children():
		child.free()
		
	for x in repeat.x:
		for y in repeat.y:
			for z in repeat.z:
				var node = scene.instantiate()
				node.position.x = x * step.x + randfn(0, random.x)
				node.position.y = y * step.y + randfn(0, random.y)
				node.position.z = z * step.z + randfn(0, random.z)
				add_child(node)
				if show_node:
					var tree = get_tree()
					if tree and tree.edited_scene_root:
						node.owner = get_tree().edited_scene_root
						
