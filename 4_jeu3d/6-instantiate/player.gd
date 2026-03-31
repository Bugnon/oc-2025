extends RigidBody3D
class_name  Player

@export var speed = 20
@export var mouse_sensitivity := 0.001
@export var jump_impulse := 8
@export_range(0, 90, 1, "radians_as_degrees") var tilt_limit: float = 30

var twist_input := 0.0
var pitch_input := 0.0

@onready var twist_pivot = $TwistPivot
@onready var pitch_pivot = $TwistPivot/PitchPivot

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#var input = Input.get_action_strength("ui_up")
	var input := Vector3.ZERO
	input.x = Input.get_axis("move_left", "move_right")
	input.z = Input.get_axis("move_forward", "move_backwards")
	apply_central_force(twist_pivot.basis * input * speed)
	
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)	
	twist_pivot.rotate_y(twist_input)
	pitch_pivot.rotate_x(pitch_input)
	pitch_pivot.rotation.x = clamp(pitch_pivot.rotation.x, 
		-tilt_limit,
		tilt_limit)
	twist_input = 0.0
	pitch_input = 0.0


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			twist_input = - event.relative.x * mouse_sensitivity
			pitch_input = - event.relative.y * mouse_sensitivity
			
	if event.is_action_pressed("jump"):
		print(position, $RayCast3D.is_colliding())
		if $RayCast3D.is_colliding():
			apply_central_impulse(Vector3.UP * jump_impulse)
