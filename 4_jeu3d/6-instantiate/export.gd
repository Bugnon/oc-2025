@icon("res://icon.svg")
@tool
extends Node3D

# CRITICAL : this is a BUG and NOTICE

"""
Exported properties
https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_exports.html

In Godot, class members can be exported. 
This means their value gets saved along with the resource 
(such as the scene) they're attached to, and get transferred 
over when using RPCs. They will also be available for editing 
in the property editor. 
Exporting is done by using the @export annotation.

One of the fundamental benefits of exporting member variables is 
to have them visible and editable in the editor. 
"""



@export var number: int = 5 ## an integer variable
@export var message: String = "hello"
@export var flag = false
@export_multiline var text = "enter your text"

@export_group("Vectors")
@export var rectangle =  Rect2(1, 2, 3, 4)
@export var rectanglei =  Rect2i(1, 2, 3, 4)
@export var vector2 =  Vector2(1, 2)
@export var vector2i =  Vector2i(1, 2)
@export var vector3 =  Vector3(1, 2, 3)
@export var vector3i =  Vector3i(1, 2, 3)
@export var aabb =  AABB(Vector3(1, 2, 3), Vector3(4, 5, 6))

@export_group("Buttons")
@export_tool_button("Configure", "BoxMesh") var hello_action = hello
@export_tool_button("Edit", "StyleBoxFlat") var action = hello

func hello():
	print("You clicked 2D/3D")

@export_group("Arrays")
@export var a = [1, 2, 3]
@export var ints: Array[int] = [1, 2, 3]
@export var bools: Array[bool] = [true, false]
@export var floats: Array[float] = [1, 2, 3]
@export var b: Array
@export var scenes: Array[PackedScene]

# Nested typed arrays such as `Array[Array[float]]` are not supported yet.
@export var two_dimensional: Array[Array] = [[1.0, 2.0], [3.0, 4.0]]
@export var vector3s = PackedVector3Array()
@export var strings = PackedStringArray()
@export_range(-360, 360, 0.001, "degrees") var laser_angles: Array[float] = []
@export_file("*.gd") var skill_trees: Array[String] = []
@export_color_no_alpha var hair_colors = PackedColorArray()
@export_enum("Espresso", "Mocha", "Latte", "Capuccino") var barista_suggestions: Array[String] = []

@export_group("Enumerations")
enum NamedEnum {THING_1, THING_2, ANOTHER_THING = -1}
@export var Enumeration: NamedEnum = 1 as NamedEnum
@export_enum("Warrior", "Magician", "Thief") var character_class: int = 1
@export_enum("Slow:30", "Average:60", "Very Fast:200") var character_speed: int = 30
@export_enum("Rebecca", "Mary", "Leah") var character_name: String = "Mary"


@export_group("Flags")
## Set any of the given flags from the editor.
@export_flags("Fire", "Water", "Earth", "Wind") var spell_elements
@export_subgroup("2D")
@export_flags_2d_physics var layers_2d_physics
@export_flags_2d_render var layers_2d_render
@export_flags_2d_navigation var layers_2d_navigation
@export_subgroup("3D")
@export_flags_3d_physics var layers_3d_physics
@export_flags_3d_render var layers_3d_render
@export_flags_3d_navigation var layers_3d_navigation

@export_group("Limits")
@export_range(0, 20, 1) var float1 = 3.0
@export_range(-10, 20, 0.1) var float2 = 6.1
@export_range(-10, 20, 0.5) var float3 = 11.5
@export_range(0, 10, 1, "or_less") var or_less = -3.
@export_range(0, 10, 1, "or_greater") var or_greater = 15.
@export_range(1, 100, 0.01, "exp") var exponential : float
@export_range(1, 10, 1, "hide_slider") var no_slider
@export_range(1, 10, 1) var slider

@export_group("Suffixes")
@export_range(0, 100, 1, "suffix:m") var length: int = 2
@export_range(0, 100, 1, "suffix:s") var time: int = 3
@export_range(0, 100, 1, "suffix:m/s") var speed: int = 23
@export_range(0, 360, 0.1, "radians_as_degrees") var angle_in_rad: float
@export_range(0, 360, 0.1, "suffix:°") var angle_in_deg: float

@export_exp_easing var transition_speed

@export_group("Files")
@export_file var file_name
@export_dir var directory_name
@export_file("*.gd") var script_file
@export_file("*.tscn") var scene_file
## Using paths in the global filesystem is also 
## possible, but only in scripts in tool mode.
@export_global_file("*.png") var tool_image

@export_group("Colors")
@export var color1: Color
@export_color_no_alpha var color2:Color = Color(255, 100, 0)
@export var color3 = Color(0, 255, 10)
@export var red = Color.RED
@export var blue = Color.ROYAL_BLUE


@export_group("Resources")
@export var resource: Resource
@export var animation: AnimationNode
@export var node: Node
@export var some_button: BaseButton

@export_subgroup("Extra Properties")
@export var string = "hello world"


@export_category("Category")
## Better not use categories as they 
## interfere with expected class inheritance.
@export var dont_use_categories = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
