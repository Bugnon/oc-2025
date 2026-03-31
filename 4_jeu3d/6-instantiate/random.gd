@tool
extends Node3D

@export var std_dev = Vector3i(10, 0, 5):
	set(x):
		std_dev = x
		create()
	
@export var count = 100:
	set(x):
		count = x
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
		
	for i in count:
		var node = scene.instantiate()
		node.position.x = randfn(0, std_dev.x)
		node.position.y = randfn(0, std_dev.y)
		node.position.z = randfn(0, std_dev.z)
		add_child(node)
		if show_node:
			var tree = get_tree()
			if tree and tree.edited_scene_root:
				node.owner = get_tree().edited_scene_root
				
