extends CanvasLayer

var screens = ["res://Components/UI/loading_screens/bus.tscn",
"res://Components/UI/loading_screens/flags.tscn"]

var screen
var anim_player

signal fade_finished

func _ready() -> void:
	get_tree().paused = true

func fade_in():
	screen = load(screens.pick_random()).instantiate()
	$Control.add_child(screen)
	anim_player = screen.get_node("AnimationPlayer")
	anim_player.play("fade_in")
	await anim_player.animation_finished
	fade_finished.emit()

func fade_out():
	$AnimationPlayer.play("fade_out")
	await $AnimationPlayer.animation_finished
	get_tree().paused = false
	self.queue_free()
