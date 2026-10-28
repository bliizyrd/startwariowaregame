extends Node2D

@onready var themed_timer: Node2D = $themedtimer

var finished = false
var buttons_pressed := 0
var timer_end = false

func _ready() -> void:
	await themed_timer.Timer(7.0)
	#after this is completed...
	timer_end = true 


func _process(_delta: float) -> void:
	if finished:
		return
	if buttons_pressed >= 7:
		finished = true
		get_tree().change_scene_to_file("res://scenes/winscreen.tscn")
	
	elif timer_end:
		Globalscript.lives -= 1
		Globalscript.minigames_done -= 1
		get_tree().change_scene_to_file("res://scenes/levelscene.tscn")


func _on_button_2_pressed() -> void:
	pass # Replace with function body.
