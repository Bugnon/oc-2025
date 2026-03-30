#@tool # <--- This is the magic word
extends Node3D

@export var dimension = 2:
	set(x):
		dimension = x

func _ready():
	# This will now run inside the editor as soon as the scene loads
	if Engine.is_editor_hint(): 
		create_box()

func create_box():
	# Check if it already exists to avoid duplicating every time you reopen the scene
	if has_node("GeneratedBox"):
		return

	var box = CSGBox3D.new()
	box.name = "GeneratedBox"
	box.size = Vector3(1, 1, 3)
	box.position = Vector3(3, 0, 3)
	add_child(box)
	
	# This line ensures the editor "sees" the node in the Scene Tree
	box.owner = get_tree().edited_scene_root
