extends Control

var next_dialog

func _on_button_pressed() -> void:
	Audio.play_sfx("click")
	Dialog.has_chosen.emit()
	print("Chain dialog: " + next_dialog)
	Dialog.start_dialog(Def.dialog_lines.get(next_dialog))

func _on_button_mouse_entered() -> void:
	%Marker.visible = true

func _on_button_mouse_exited() -> void:
	%Marker.visible = false

func set_label(label_text : String) -> void:
	%Label.text = label_text

func set_next_dialog(next_dialog_local : String) -> void:
	next_dialog = next_dialog_local
