extends CanvasLayer
class_name Textbox

@onready var char_name: Label = $Container/Name
@onready var text_label: RichTextLabel = $Container/Text
@onready var timer: Timer = $Timer
@onready var textbox: CanvasLayer = $"."

const MAX_WIDTH = 256

var text = ""
var letter_index = 0
var speaker_name
var will_speak = false

var letter_time = 0.03
var space_time = 0.06
var punc_time = 0.2

signal finished_displaying

func display_text(text_to_display : String, speaker_name_func : String):
	letter_index = 0
	speaker_name = speaker_name_func
	match speaker_name:
		"Protagonista":
			char_name.text = (Def.save.char_name).to_upper()
		"":
			char_name.text = ""
			text_to_display = "[i]" + text_to_display + "[/i]"
		_:
			char_name.text = speaker_name.to_upper()
	
	text = text_to_display
	_display_letter()

func _display_letter():
	will_speak = false
	text_label.text = text.format({"name": Def.save.char_name})
	text_label.visible_characters = letter_index + 1
	
	letter_index += 1
	if letter_index >= text.length():
		finished_displaying.emit()
		return
	
	match text[letter_index]:
		"!", ".", "?", "…":
			will_speak = true
			timer.start(punc_time)
			Dialog.textbox_char_passed.emit(speaker_name, false)
		",":
			timer.start(punc_time)
			Dialog.textbox_char_passed.emit(speaker_name, false)
		" ":
			timer.start(space_time)
			Dialog.textbox_char_passed.emit(speaker_name, false)
		_:
			will_speak = true
			Dialog.textbox_char_passed.emit(speaker_name, true)
			timer.start(letter_time)

func _on_letter_display_timer_timeout() -> void:
	if will_speak == true:
		Audio.play_sfx("voice")
	_display_letter()

func _unhandled_input(event) -> void:
	if (
		event.is_action_pressed("advance_dialog")
	):
		letter_index = text.length()
		Dialog.textbox_char_passed.emit(speaker_name, false)
