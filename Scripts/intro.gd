extends CanvasLayer

@onready var label = $RichTextLabel
@onready var label2 = $RichTextLabel2
@onready var animplayer = $AnimationPlayer

signal next
signal name_chosen

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Audio.play_music("dark_drone")
	$TextEdit.visible = false
	
	await get_tree().create_timer(1.0).timeout
	
	animplayer.play("fade_in")
	await animplayer.animation_finished
	await next
	animplayer.play_backwards("fade_in")
	await animplayer.animation_finished
	
	await get_tree().create_timer(1.0).timeout
	
	label.text = "NAME_INTRO2"
	animplayer.play("fade_in")
	await animplayer.animation_finished
	await next
	animplayer.play_backwards("fade_in")
	await animplayer.animation_finished
	
	await get_tree().create_timer(1.0).timeout
	
	label.text = "NAME_INTRO3"
	animplayer.play("fade_in")
	await animplayer.animation_finished
	$TextEdit.visible = true
	await name_chosen
	$TextEdit.visible = false
	
	Audio.play_sfx("name_chosen")
	Audio.stop_all_music()
	
	label.text = "NAME_REVEAL"
	label2.text = ("{name}.").format({"name": Def.save.char_name}).to_upper()
	animplayer.play("fade_in")
	await animplayer.animation_finished
	await next
	
	Scene.change_scene("police_hall")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("advance_dialog"):
		next.emit()


func _on_text_edit_text_set(new_text : String) -> void:
	Def.save["char_name"] = new_text
	name_chosen.emit()
