extends Node2D

@onready var themedtimer: Node2D = $themedtimer

var Key_collected = 0
var timer_end = false
var finished := false



func _ready() -> void:
	$Key.key_collected.connect(Key_collect)
	$Key2.key_collected.connect(Key_collect)
	$Key3.key_collected.connect(Key_collect)

	await themedtimer.Timer(15.0)
	timer_end = true



func _process(_delta: float) -> void:
	if finished:
		return

	if Key_collected >= 3:
		finished = true
		get_tree().change_scene_to_file("res://scenes/levelscene.tscn")


	elif timer_end:
		finished = true
		Globalscript.minigames_done -= 1   # no clamp here
		Globalscript.lives -= 1            # this line was missing
		get_tree().change_scene_to_file("res://scenes/levelscene.tscn")


func Key_collect() -> void:
	Key_collected += 1
