@tool
extends EditorScript

@export var x = 123


# Called when the script is executed (using File -> Run in Script Editor).
func _run() -> void:
	pass
	print("run the EditorScript", x)
