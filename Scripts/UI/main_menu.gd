extends CanvasLayer

func _ready() -> void:
	%Menu.visible = true
	%Options.visible = false
	%Credits.visible = false
	
	Audio.play_music("main_menu")

func _on_start_game_button_pressed() -> void:
	Audio.stop_all_music()
	play_sound()
	Scene.change_scene("intro")

func _on_settings_button_pressed() -> void:
	%Menu.visible = false
	%Options.visible = true
	%Credits.visible = false
	play_sound()

func _on_credits_button_pressed() -> void:
	%Menu.visible = false
	%Options.visible = false
	%Credits.visible = true
	play_sound()

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_return_button_pressed() -> void:
	%Menu.visible = true
	%Options.visible = false
	%Credits.visible = false
	play_sound()

func _on_return_button_2_pressed() -> void:
	%Menu.visible = true
	%Options.visible = false
	%Credits.visible = false
	play_sound()

func play_sound() -> void:
	Audio.play_sfx("click")
