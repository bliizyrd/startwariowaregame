extends Node2D

@onready var lifeiconcontainer: HBoxContainer = $lifeiconcontainer
@onready var lifeicon: TextureRect = $lifeiconcontainer/lifeicon
@onready var lifeicon2: TextureRect = $lifeiconcontainer/lifeicon2
@onready var lifeicon3: TextureRect = $lifeiconcontainer/lifeicon3
@onready var lifeicon4: TextureRect = $lifeiconcontainer/lifeicon4
@onready var lifeicon5: TextureRect = $lifeiconcontainer/lifeicon5
@onready var level: RichTextLabel = $level
@onready var timer: RichTextLabel = $timer

var time

func _ready() -> void:
	await Timer(3.0) # using the function created 

	if Globalscript.minigames_done < 3: #if you havent completed 3 minigames yet 
		Globalscript.minigames_done = Globalscript.minigames_done +1
		get_tree().change_scene_to_file("res://scenes/minigame_" + str(Globalscript.minigames_done) + ".tscn") # changes your scene by arranging this frankenstein path
		Transitionscreen.transition()
		await Transitionscreen.on_transition_finish
	
		
# above, your script is being told to go to the next minigame. If the 
# current minigame is level 1, then you would be on minigame 1. If you 
# complete that level, you have the minigames_done add one, and then you 
# look for the scene titled `minigame_` and then whatever minigame number 
# should be next. make sure you name your minigame saves appropriately.

	else:
		get_tree().change_scene_to_file("res://titlescreen.tscn") # changes your scene


func _process(delta: float) -> void: # runs every frame
	match Globalscript.lives: # asks or checks if lives is equal to one of 
		#these values, cool hack. by the way this is a horrid way to illustrate the
		#lives visually so later you can always find an alternative code. now, dw about it.
		
		
			4:
				lifeicon.hide()
			3:
				lifeicon.hide()
				lifeicon2.hide()
			2:
				lifeicon.hide()
				lifeicon2.hide()
				lifeicon3.hide()
			1:
				lifeicon.hide()
				lifeicon2.hide()
				lifeicon3.hide()
				lifeicon4.hide()
			0:
				lifeiconcontainer.hide() # hides everything
	timer.text=str(time) #text reflects value of the time variable. this makes names easier. the str() converts the int to a string
	level.text= "Level" + str(Globalscript.minigames_done) #tells you what minigame you're on using concatenation


func Timer(start_time: float): #making a new function for timer countdown
	#we want the timer to go down, and when it reaches 0 it transitions to the next scene
	
	time = start_time # make the timer, which is reflected through the timer text, start at your desired number
	while  time > 0.0: #run if timer hasnt reached 0
			await wait(0.1) # asks script to wait on this function. the 'wait' name for the function does nothing here, as await is just telling the script to wait for the function to complete before progressing
			time -= 0.1 #remove 0.1 to get progressively smaller value
	
	
	return #when timer reaches 0

func wait(seconds: float) -> void: #write this for wait
	await get_tree().create_timer(seconds).timeout #makes you wait
