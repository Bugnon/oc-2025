extends Area3D

@export var material_1: StandardMaterial3D
@export var material_2: StandardMaterial3D

@onready var cylinder: CSGCylinder3D = $CollisionShape3D/CSGCylinder3D

var active := false:
	set(x):
		active = x
		cylinder.material_override = material_1 if active else material_2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	active = false


func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		active = true
		body.respawn_position = body.global_position
		
