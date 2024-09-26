extends AnimatedSprite2D



#This code is to spawn the enemy death animation in game when dead
func _on_animation_finished() -> void:
	queue_free()
