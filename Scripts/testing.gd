extends Node


var dialog_lines : Dictionary = {
"0" : {"name" : "teste", "text" : "iasdiasdiasdiasd iasd iasd iasd", "expression" : ""},
"1" : {"name" : "teste", "text" : "iasdasd", "expression" : ""},
"2" : {"name" : "teste", "text" : "iasds", "expression" : ""}}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialog.start_dialog(dialog_lines)
