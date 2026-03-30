@tool
extends Sprite2D

@export_range(-2, 2, 0.2) var speed = 1.:
	# update speed and reset
	set(new__speed):
		speed = new__speed
		rotation = 0
		
@export var size = 1:
	# update size
	set(x):
		size = x

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	scale = Vector2(size, size)
	rotation += PI * delta * speed
