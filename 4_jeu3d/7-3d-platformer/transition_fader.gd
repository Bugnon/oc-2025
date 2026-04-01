extends CanvasLayer

@onready var color_rect: ColorRect = $ColorRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = create_tween()
	tween.tween_property(color_rect, "self_modulate", Color.TRANSPARENT, 1)

func transition(midpoint_function: Callable):
	var tween = create_tween()
	tween.tween_property(color_rect, "self_modulate", Color.WHITE, 0.3)
	tween.tween_callback(midpoint_function)
	tween.tween_interval(0.1)
	tween.tween_property(color_rect, "self_modulate", Color.TRANSPARENT, 0.3)
	
