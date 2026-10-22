extends CanvasLayer

signal on_transition_finish

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var color_rect: ColorRect = $transitioncolor


func _ready():
	color_rect.visible = true
	animation_player.animation_finished.connect(_on_animation_finished)
	animation_player.play("fade_from_black")

func _on_animation_finished(anim_name):
		if anim_name == "fade_from_black":
			on_transition_finish.emit()
			# give the scene a couple of frames to happen, then clear the black
			await get_tree().process_frame
			await get_tree().process_frame
			color_rect.visible = false

func transition():
	color_rect.visible = true
	animation_player.play("fade_from_black")
