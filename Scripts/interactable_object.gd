extends Area2D
class_name Interactable

var is_mouse_inside : bool = false

@export var next_scene : String

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("left_mouse_button") and is_mouse_inside:
		Audio.play_sfx("enter")
		Scene.change_scene(next_scene)

func _on_mouse_entered() -> void:
	is_mouse_inside = true
	$door_closed.visible = false
	$door_open.visible = true

func _on_mouse_exited() -> void:
	is_mouse_inside = false
	$door_closed.visible = true
	$door_open.visible = false
