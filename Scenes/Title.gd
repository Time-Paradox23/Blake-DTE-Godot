extends Node2D

func _on_start_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		get_tree().change_scene_to_file("res://Scenes/world.tscn")
	


func _on_quit_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		get_tree().quit()
	
