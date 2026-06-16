extends Node
class_name DialogSystem

@onready var text_box_scene = preload("res://Components/UI/textbox.tscn")

var dialog_lines : Dictionary = {}
var current_line_index = 0

var text_box

var is_dialog_active = false
var can_advance_line = false

signal dialog_ended
signal set_character(char_name : String, expression : String)
signal textbox_char_passed(char_name : String, should_open : bool)

func start_dialog(lines: Dictionary):
	print("Dialog : Dialog Started")
	if is_dialog_active:
		return
	
	dialog_lines =  lines
	_show_text_box()
	
	is_dialog_active = true

func _show_text_box():
	text_box = text_box_scene.instantiate()
	text_box.finished_displaying.connect(_on_text_box_finished_displaying)
	add_child(text_box)
	text_box.display_text(dialog_lines[str(current_line_index)].text, dialog_lines[str(current_line_index)].name)
	can_advance_line = false
	
	# set expression
	set_character.emit(dialog_lines[str(current_line_index)].name, dialog_lines[str(current_line_index)].expression)


func _display_next_line():
	#change expression
	set_character.emit(dialog_lines[str(current_line_index)].name, dialog_lines[str(current_line_index)].expression)
	
	#display next line
	text_box.display_text(dialog_lines[str(current_line_index)].text, dialog_lines[str(current_line_index)].name)
	can_advance_line = false

func _on_text_box_finished_displaying():
	can_advance_line = true

func _unhandled_input(event) -> void:
	if (
		event.is_action_pressed("advance_dialog") && 
		is_dialog_active &&
		can_advance_line
	):
		
		current_line_index += 1
		if current_line_index >= dialog_lines.size():
			is_dialog_active = false
			current_line_index = 0
			dialog_ended.emit()
			return
		
		_display_next_line()
