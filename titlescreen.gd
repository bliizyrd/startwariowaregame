extends Node2D

@onready var transition_scene = $transitionscreen

func _on_start_game_pressed() -> void:
	get_tree().change_scene_to_file("res://levelscene.tscn")
	Transitionscreen.transition()
	await Transitionscreen.on_transition_finish


func _on_settings_pressed() -> void:
	get_tree().settings()
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
