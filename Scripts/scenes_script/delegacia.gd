extends Node

signal dialog_continue

var has_played = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(1).timeout
	Dialog.start_dialog(Def.delegacia_0)
	Dialog.dialog_ended.connect(check_if_still_dialog)
	await dialog_continue
	check_if_still_dialog()

func check_if_still_dialog():
	await get_tree().create_timer(1.0).timeout
	if Dialog.is_dialog_active == false and not has_played:
		has_played = true
		Audio.play_sfx("knock")
		Dialog.start_dialog(Def.delegacia_2)
		await Dialog.dialog_ended
		Scene.change_scene("thanks")
