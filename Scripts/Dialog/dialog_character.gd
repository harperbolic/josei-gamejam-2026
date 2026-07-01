extends Node2D
class_name Character

@export var animation_player : AnimationPlayer
@export var character_name : String

@onready var blink_timer = $"../../BlinkTimer"

@onready var current_pose

func _ready() -> void:
	##animation_player.play("enter")
	Dialog.textbox_char_passed.connect(_open_mouth)
	Dialog.set_character.connect(change_pose)

func change_pose(local_character_name : String, pose : String):
	if local_character_name == character_name:
		_hide_all_poses()
		match pose:
			"neutral":
				current_pose = $Neutral
			"anxious":
				current_pose = $Anxious
			"worried":
				current_pose = $Worried
			"surprised":
				current_pose = $Surprised
			"rubbing_temples":
				current_pose = $Rubbing_temples
			_:
				current_pose = null
		if current_pose != null:
			current_pose.visible = true

func _hide_all_poses():
	for child in get_children():
		child.visible = false

func exit():
	animation_player.play_backwards("enter")
	await animation_player.animation_finished
	self.queue_free()

func _on_blink_timer_timeout() -> void:
	if current_pose != null and current_pose.get_node_or_null("Blinking") != null:
		current_pose.get_node("Blinking").visible = true
		await get_tree().create_timer(0.1).timeout
		current_pose.get_node("Blinking").visible = false
		blink_timer.start(randf_range(3.0, 4.0))

func _open_mouth(local_character_name : String, open: bool) -> void:
	if local_character_name == character_name and current_pose != null:
		if open:
			current_pose.get_node("Speaking").visible = true
		else:
			current_pose.get_node("Speaking").visible = false

func _on_speak_timer_timeout() -> void:
	if current_pose:
		current_pose.get_node("Speaking").visible = false
