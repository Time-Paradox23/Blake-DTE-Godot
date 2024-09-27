extends Node2D
#This code is to chage scenes from Title to map
func _on_start_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		get_tree().change_scene_to_file("res://Scenes/world.tscn")
	

#This will close the game if the button is clicked
func _on_quit_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		get_tree().quit()
	
