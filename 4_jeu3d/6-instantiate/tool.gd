@tool
extends Node2D

"""
@tool is a powerful line of code that, when added at the top of your script, 
makes it execute in the editor.

source:
https://docs.godotengine.org/en/stable/tutorials/plugins/running_code_in_the_editor.html

"""

@onready
var icon2 = $Icon2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var t = Time.get_ticks_msec() / 1000.
	
	#icon2.position.x = int(400 + 300 * sin(t))
	#icon2.scale.x = 2 + sin(t)
	#icon2.scale.y = 2 + sin(t)
	
	
