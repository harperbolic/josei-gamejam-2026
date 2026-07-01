extends Node
class_name DialogSystem

@onready var text_box_scene = preload("res://Components/UI/textbox.tscn")
@onready var choice_layer_scene = preload("res://Components/UI/choices_layer.tscn")
@onready var choice_button_scene = preload("res://Components/UI/choice_button.tscn")

var dialog_lines : Dictionary = {}
var current_line_index = 0

var text_box
var choice_layer

var is_dialog_active = false
var can_advance_line = false
var is_choosing = false

signal dialog_ended
signal set_character(char_name : String, expression : String)
signal textbox_char_passed(char_name : String, should_open : bool)
signal has_chosen

func start_dialog(lines: Dictionary):
	current_line_index = 0
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

func _show_choices():
	var choice_buttons = []
	is_choosing = true
	choice_layer = choice_layer_scene.instantiate()
	add_child(choice_layer)
	var array_scene_counter = 0
	while(current_line_index < dialog_lines.size()):
		choice_buttons.append(choice_button_scene.instantiate())
		choice_layer.get_child(0).add_child(choice_buttons[array_scene_counter])
		
		# Set button parameters
		choice_buttons[array_scene_counter].set_label(dialog_lines[str(current_line_index)].text)
		choice_buttons[array_scene_counter].set_next_dialog(dialog_lines[str(current_line_index)].exec)
		
		current_line_index += 1
		array_scene_counter += 1
	await has_chosen
	choice_layer.queue_free()

func _display_next_line():
	#check if it's choice
	match dialog_lines[str(current_line_index)].name:
		"CH":
			await _show_choices()
			is_choosing = false
			finish_dialog()
		"Exec":
			print("Chain dialog: " + dialog_lines[str(current_line_index)].exec)
			match dialog_lines[str(current_line_index)].text:
				"start_dialog":
					dialog_lines = Def.dialog_lines.get(dialog_lines[str(current_line_index)].exec)
					current_line_index = 0
					_display_next_line()
	
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
		can_advance_line &&
		not is_choosing
	):
		
		current_line_index += 1
		if current_line_index >= dialog_lines.size():
			finish_dialog()
		
		_display_next_line()

func finish_dialog() -> void:
	is_dialog_active = false
	current_line_index = 0
	dialog_ended.emit()
	text_box.queue_free()
	return
