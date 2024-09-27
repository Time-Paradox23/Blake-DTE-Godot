extends Area2D
#this code is for the speed at which the knife travels across the screen
@export var SPEED = 200
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# This piece of code controls the knife rotation.
func _process(delta):
	translate(Vector2.RIGHT.rotated(rotation) * SPEED * delta)

#This is to help track when the knife makes contact with a enemy hitbox
func _on_body_entered(body):
	if body.is_in_group("Enemy") and body.has_method("take_damage"):
		body.take_damage(WeaponKnife.knife_damage)	
		queue_free()
