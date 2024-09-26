extends CharacterBody2D

#These are values that determine the enemies speed and health
const SPEED = 25.0
@onready var sprite = $Sprite
@onready var player = get_tree().get_first_node_in_group("Player")
const DEATH = preload("res://Scenes/enemy_death.tscn")
@onready var health = 10 

#This block of code is for the enemy to track the player
func _physics_process(delta):
	var direction_to_player = global_position.direction_to(player.global_position)
	velocity = direction_to_player * SPEED
	
	if velocity.x > 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
	
	
	move_and_slide()
#The code below is to spawn in the enemy death animation once the enemy is dead
func take_damage(dmg):
	health -= dmg
	if health <= 0:
		queue_free()
		var new_death = DEATH.instantiate()
		new_death.global_position = global_position
		add_sibling(new_death)
