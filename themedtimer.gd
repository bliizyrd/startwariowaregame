extends Node2D

@onready var timer: RichTextLabel = $timer

var time : float 
	# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer.text = str(snapped(time, 0.10)) # this makes names easier

func Timer(start_time: float) -> void:
	# countdown, then transaction when it reaches 0
	time = start_time 
	
	while time > 0.0: 
		await wait(0.10)
		time = time - 0.10
	#when timer reaches 0
	return

func wait(seconds: float) -> void: # write this simple function out for wait!
	await get_tree().create_timer(seconds).timeout # makes u wait
