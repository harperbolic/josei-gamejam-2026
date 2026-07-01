extends CanvasLayer

signal skip

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%FictionWarning.visible = true
	%LightsWarning.visible = false
	%Credits.visible = false
	$AnimationPlayer.play("display_splash")
	await $AnimationPlayer.animation_finished
	
	%FictionWarning.visible = false
	%LightsWarning.visible = true
	%Credits.visible = false
	$AnimationPlayer.play("display_splash")
	await $AnimationPlayer.animation_finished
	Scene.change_scene("main_menu")

func _unhandled_input(event: InputEvent) -> void:
	if (event.is_action_pressed("advance_dialog")):
		skip.emit()
