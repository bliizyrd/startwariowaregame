extends Node2D

func _ready() -> void:
	Globalscript.lives = 5
	Globalscript.minigames_done = 0
	$"main menu".pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/titlescreen.tscn")
