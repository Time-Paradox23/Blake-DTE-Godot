extends Node2D

#This will take the player back to title screen upon death
func _on_return_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		get_tree().change_scene_to_file("res://Scenes/Title.tscn")
	

#this closes the game
func _on_quit_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		get_tree().quit()
	
