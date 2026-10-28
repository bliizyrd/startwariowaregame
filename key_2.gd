# the onreadys below run immediately at the start of the game, preventing 
# errors related to variable that haven't been defined yet in later scripts 

extends Node2D

@onready var player_area: Area2D = $"../player/area2d"
@onready var player: CharacterBody2D = $"../player"
@onready var self_area: Area2D = $keybody


# make a signal
signal key_collected

func _process(delta: float) -> void: # this runs EVERY FRAME! 
	
	if player_area.overlaps_area(self_area): # checks if overlapping
		if self.visible:
			emit_signal("key_collected") #signal broadcast
			self.hide() #removed from player sight; collected
		

# Because you're emitting a signal here, you need to connect that signal to 
# something to actually make it do a function. To do that, go to the
# `Signals` menu next to the inspector tab and double click it. 
# You would then need to connect it to the parent script or scene script
# and also name it something. You can name it ` key_collect` as seen 
# below, in the next script.
