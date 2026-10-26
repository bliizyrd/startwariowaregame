extends Node2D

@onready var themedtimer: Node2D = $themedtimer



var Key_collected = 0 # just keeping track of Key collected
var timer_end = false # boolean (true or false) stating whether the timer ended

func _ready() -> void:

		#Below you can see that I have a function that I named. I grab a 
		#function from it that was created in it's script and use `await` to 
		# tell the script to wait for a signal, or for when a function finshes


	await themedtimer.Timer(15.0) #accessing a function from this node
	#after this is compeleted...
	timer_end = true # now we're saying "oh ye you ran out of time"

func _process(delta: float) -> void: # running every frame brochacho
	
	if Key_collected == 3: # the double equals is just an argument asking if it's the same, with "=" it'll give an error
		if Globalscript.minigames_done > 3: # we access a Globalscript script and see how many minigames have been compeleted
			get_tree().change_scene_to_file("res://scenes/done_screen.tscn") # change current play scene into another, but you make your own finish screen in a later challenge, dont worry abt this rn
		else:
			get_tree().change_scene_to_file("res://scenes/levelscene.tscn") # go back to the intermission scene
	
	if timer_end: # if the timer does end...
		Globalscript.minigames_done -=1 #go back a minigame
		Globalscript.lives -= 1 # lose ur lives
		get_tree().change_scene_to_file("res://scenes/levelscene.tscn") # back to intermission
		

func Key_collect() -> void: # cool function that you connect to those Keys
	Key_collected = Key_collected +1
	return
