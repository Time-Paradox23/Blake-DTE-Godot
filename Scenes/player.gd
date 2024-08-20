extends CharacterBody2D


@export var SPEED = 100.0
@export var ACCELERATION = 20.0
@export var FRICTION = 10.0
@onready var sprite = $Sprite
const KNIFE = preload("res://Scenes/knife.tscn")
@onready var world = get_node('/root/World')
var direction = Vector2.ZERO

enum state {IDLE, LEFT, RIGHT}

var anim_state = state.IDLE

@onready var animator = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer


func _process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector ("Left","Right", "Up", "Down").normalized()
	if direction:
		velocity = velocity.move_toward(direction * SPEED, ACCELERATION)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
		
	if velocity.x < 0:
		sprite.flip_h = true
	elif velocity.x > 0:
		sprite.flip_h = false
	
	
	move_and_slide()


func _on_knife_timer_timeout():
	var knife = KNIFE.instantiate()
	knife.global_position = global_position
	knife.rotate(direction.angle())
	world.add_child(knife)
