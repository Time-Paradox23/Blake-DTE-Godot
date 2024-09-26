extends CharacterBody2D

#These variables are to help with player movement in game
@export var SPEED = 100.0
@export var ACCELERATION = 20.0
@export var FRICTION = 10.0
@onready var sprite = $Sprite
const KNIFE = preload("res://Scenes/knife.tscn")
@onready var world = get_node('/root/World')
var direction = Vector2.ZERO
var last_direction = Vector2.ZERO

enum state {LEFT, RIGHT}


@onready var animator = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer


func _process(delta):

	# This code affects the player movement and rotation of animations.
	direction = Input.get_vector ("Left","Right", "Up", "Down").normalized()
	if direction:
		velocity = velocity.move_toward(direction * SPEED, ACCELERATION)
		last_direction = direction
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
		
	if velocity.x < 0:
		sprite.flip_h = true
	elif velocity.x > 0:
		sprite.flip_h = false
	
	
	move_and_slide()

#This block of code is to spawn in the weapon on the player
func _on_knife_timer_timeout():
	var knife = KNIFE.instantiate()
	knife.global_position = global_position
	knife.rotate(last_direction.angle())
	world.add_child(knife)
