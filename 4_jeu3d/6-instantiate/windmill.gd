@tool
extends Node3D

@onready
var blade = $Stand/Blade

@export_range(-2, 2, 0.1) var speed = 1.:
	# update speed and reset
	set(x):
		speed = x
		
@export var blade_size = Vector3(0.1, 6, 1):
	# update speed and reset
	set(x):
		blade_size = x
		blade.mesh.size = x
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	blade.mesh.size = blade_size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	blade.rotation.x += PI * delta * speed
	blade.mesh.size = blade_size
