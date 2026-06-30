extends Node

# Save
var save : Dictionary = {
	"selected_locale" : "pt",
	"char_name" : "Lelelele"
}

var dialog_lines: Dictionary = {}

# Text declaration
var delegacia_0 : Dictionary
var delegacia_0C1 : Dictionary
var delegacia_0C2 : Dictionary
var delegacia_0C3 : Dictionary
var delegacia_1 : Dictionary

func _ready() -> void:
	load_text()
	dialog_lines = {
		"delegacia_0" : delegacia_0,
		"delegacia_0C1" : delegacia_0C1,
		"delegacia_0C2" : delegacia_0C2,
		"delegacia_0C3" : delegacia_0C3,
		"delegacia_1" : delegacia_1,
	}

func load_text() -> void:
	var access = FileAccess.open("res://Text/" + save.selected_locale + "/delegacia_0.json", FileAccess.READ)
	delegacia_0 = JSON.parse_string(access.get_as_text())
	access.close()
	access = FileAccess.open("res://Text/" + save.selected_locale + "/delegacia_0C1.json", FileAccess.READ)
	delegacia_0C1 = JSON.parse_string(access.get_as_text())
	access.close()
	access = FileAccess.open("res://Text/" + save.selected_locale + "/delegacia_0C2.json", FileAccess.READ)
	delegacia_0C2 = JSON.parse_string(access.get_as_text())
	access.close()
	access = FileAccess.open("res://Text/" + save.selected_locale + "/delegacia_0C3.json", FileAccess.READ)
	delegacia_0C3 = JSON.parse_string(access.get_as_text())
	access.close()
	access = FileAccess.open("res://Text/" + save.selected_locale + "/delegacia_1.json", FileAccess.READ)
	delegacia_1 = JSON.parse_string(access.get_as_text())
	access.close()
