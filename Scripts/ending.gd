extends CanvasLayer

@onready var animplayer = $AnimationPlayer

signal next
signal name_chosen

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animplayer.play("fade_in")
	await animplayer.animation_finished
	await next
	
	Scene.change_scene("main_menu")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("advance_dialog"):
		next.emit()


func _on_text_edit_text_set(new_text : String) -> void:
	Def.save["char_name"] = new_text
	name_chosen.emit()
