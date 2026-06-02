extends Control
class_name Character

@export_enum("Sad", "Happy", "Angry") var current_pose : String
@export var character_id : String
@export var character_name : String

@export var animation_player : AnimationPlayer

func _ready() -> void:
	animation_player.play("enter")

func change_pose(pose : String):
	_hide_all_poses()
	match pose:
		"Sad":
			$Sprites/Sad.visible = true
		"Happy":
			$Sprites/Happy.visible = true
		"Angry":
			$Sprites/Angry.visible = true
	
	animation_player.play("change_pose")

func _hide_all_poses():
	for child in $Sprites:
		child.visible = false

func exit():
	animation_player.play_backwards("enter")
	await animation_player.animation_finished
	self.queue_free()
