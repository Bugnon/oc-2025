extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		var tween := create_tween().set_parallel(true)
		tween.tween_property(self, "global_position", body.global_position + Vector3.UP, 0.3)
		tween.tween_property(self, "scale", Vector3.ONE*0.001, 0.2)
		tween.set_parallel(false)
		tween.tween_callback(
			func(): body.coin_count += 1
		)
		tween.tween_callback(queue_free)
