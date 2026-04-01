extends RigidBody3D
class_name  Player


@export var speed = 20
@export var mouse_sensitivity := 0.001
@export var jump_impulse := 8
@export_range(0, 90, 1, "radians_as_degrees") var tilt_limit: float = 30
@export var camera_distance = 3:
	set(x):
		camera_distance = x
		set_parameters()

var twist_input := 0.0
var pitch_input := 0.0
var respawn_position := global_position

@onready var twist_pivot = $TwistPivot
@onready var pitch_pivot = $TwistPivot/PitchPivot
@onready var camera: Camera3D = $TwistPivot/PitchPivot/Camera3D
@onready var label: Label = $CanvasLayer/Label
@onready var character: Node3D = $Character
@onready var animator: AnimationTree = $AnimationTree
@onready var playback = animator["parameters/playback"]
var blend_path := "parameters/Run/blend_position"


var coin_count :=0:
	set(value):
		coin_count = value
		label.text = "Coins: " + str(coin_count)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func set_parameters() -> void:
	if camera:
		camera.position.z = camera_distance


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input := Vector3.ZERO
	input.x = Input.get_axis("move_left", "move_right")
	input.z = Input.get_axis("move_forward", "move_backward")
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
	
	if not input.is_zero_approx():
		var move_direction = twist_pivot.basis * input
		var align = character.transform.looking_at(character.transform.origin - move_direction)
		character.transform = character.transform.interpolate_with(align, delta * 20.0)
	
	animator[blend_path] = lerp(
		animator[blend_path],
		input.length(),
		delta * 5.0
		)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			twist_input = - event.relative.x * mouse_sensitivity
			pitch_input = - event.relative.y * mouse_sensitivity
			
	if event.is_action_pressed("jump"):
		if $RayCast3D.is_colliding():
			apply_central_impulse(Vector3.UP * jump_impulse)
			playback.start("Hop")
