extends Node2D
#Thiese variables control where the enemies spawn
@onready var spawn_points = $SpawnPoints.get_children()
@onready var spawn_timer = $SpawnTimer
@onready var world = get_node("/root/World")
@onready var camera = $".."
const ZOMBIE = preload("res://Scenes/zombie.tscn")

#This helps the zombies spawn at certain points on the map
func spawn_enemy():
	var enemy = ZOMBIE.instantiate()
	var spawn_point = spawn_points.pick_random()
	enemy.global_position = spawn_point.global_position
	world.add_child(enemy)

func _on_spawn_timer_timeout() -> void:
	spawn_enemy()
