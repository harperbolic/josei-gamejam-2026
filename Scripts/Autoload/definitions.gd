extends Node

# Save
var save : Dictionary = {
	"selected_locale" : "pt",
	"char_name" : "Character Name"
}

var dialog_lines: Dictionary = {}

# Text declaration
var delegacia_0 : Dictionary
var delegacia_0C1 : Dictionary
var delegacia_0C2 : Dictionary
var delegacia_0C3 : Dictionary

var delegacia_1 : Dictionary

var delegacia_1C1 : Dictionary
var delegacia_1C1_C1 : Dictionary
var delegacia_1C1_C2 : Dictionary
var delegacia_1C1_C3 : Dictionary

var delegacia_1C2 : Dictionary

var delegacia_1C2_C1 : Dictionary
var delegacia_1C2_C1_2C1 : Dictionary
var delegacia_1C2_C1_2C2 : Dictionary
var delegacia_1C2_C1_3 : Dictionary
var delegacia_1C2_C1_C1 : Dictionary
var delegacia_1C2_C1_C2 : Dictionary

var delegacia_1C1_C1_2 : Dictionary

var delegacia_1C2_C1_2 : Dictionary

var delegacia_1C2_C2 : Dictionary

var delegacia_1C3 : Dictionary
var delegacia_1C3_2 : Dictionary
var delegacia_1C3_C1 : Dictionary
var delegacia_1C3_C2 : Dictionary

var delegacia_2 : Dictionary

func _ready() -> void:
	load_text()
	dialog_lines = {
		"delegacia_0" : delegacia_0,
		"delegacia_0C1" : delegacia_0C1,
		"delegacia_0C2" : delegacia_0C2,
		"delegacia_0C3" : delegacia_0C3,
		"delegacia_1" : delegacia_1,
		"delegacia_1C1" : delegacia_1C1,
		"delegacia_1C2" : delegacia_1C2,
		"delegacia_1C3" : delegacia_1C3,
		"delegacia_1C1_C1" : delegacia_1C1_C1,
		"delegacia_1C1_C2" : delegacia_1C1_C2,
		"delegacia_1C1_C3" : delegacia_1C1_C3,
		"delegacia_1C2_C1" : delegacia_1C2_C1,
		"delegacia_1C2_C1_2C1" : delegacia_1C2_C1_2C1,
		"delegacia_1C2_C1_2C2" : delegacia_1C2_C1_2C2,
		"delegacia_1C2_C1_3" : delegacia_1C2_C1_3,
		"delegacia_1C2_C1_C1" : delegacia_1C2_C1_C1,
		"delegacia_1C2_C1_C2" : delegacia_1C2_C1_C2,
		"delegacia_1C2_C2" : delegacia_1C2_C2,
		"delegacia_1C3_2" : delegacia_1C3_2,
		"delegacia_1C3_C1" : delegacia_1C3_C1,
		"delegacia_1C3_C2" : delegacia_1C3_C2,
		"delegacia_2" : delegacia_2,
		"delegacia_1C1_C1_2" : delegacia_1C1_C1_2
	}
	print(delegacia_2)

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
	
	access = FileAccess.open("res://Text/" + save.selected_locale + "/delegacia_1C1.json", FileAccess.READ)
	delegacia_1C1 = JSON.parse_string(access.get_as_text())
	access.close()
	access = FileAccess.open("res://Text/" + save.selected_locale + "/delegacia_1C2.json", FileAccess.READ)
	delegacia_1C2 = JSON.parse_string(access.get_as_text())
	access.close()
	access = FileAccess.open("res://Text/" + save.selected_locale + "/delegacia_1C3.json", FileAccess.READ)
	delegacia_1C3 = JSON.parse_string(access.get_as_text())
	access.close()
	
	access = FileAccess.open("res://Text/" + save.selected_locale + "/delegacia_1C1_C1.json", FileAccess.READ)
	delegacia_1C1_C1 = JSON.parse_string(access.get_as_text())
	access.close()
	access = FileAccess.open("res://Text/" + save.selected_locale + "/delegacia_1C1_C2.json", FileAccess.READ)
	delegacia_1C1_C2 = JSON.parse_string(access.get_as_text())
	access.close()
	access = FileAccess.open("res://Text/" + save.selected_locale + "/delegacia_1C1_C3.json", FileAccess.READ)
	delegacia_1C1_C3 = JSON.parse_string(access.get_as_text())
	access.close()
	
	access = FileAccess.open("res://Text/" + save.selected_locale + "/delegacia_1C2_C1.json", FileAccess.READ)
	delegacia_1C2_C1 = JSON.parse_string(access.get_as_text())
	access.close()
	access = FileAccess.open("res://Text/" + save.selected_locale + "/delegacia_1C2_C1_2C1.json", FileAccess.READ)
	delegacia_1C2_C1_2C1 = JSON.parse_string(access.get_as_text())
	access.close()
	access = FileAccess.open("res://Text/" + save.selected_locale + "/delegacia_1C2_C1_2C2.json", FileAccess.READ)
	delegacia_1C2_C1_2C2 = JSON.parse_string(access.get_as_text())
	access.close()
	access = FileAccess.open("res://Text/" + save.selected_locale + "/delegacia_1C2_C1_3.json", FileAccess.READ)
	delegacia_1C2_C1_3 = JSON.parse_string(access.get_as_text())
	access.close()
	access = FileAccess.open("res://Text/" + save.selected_locale + "/delegacia_1C2_C1_C1.json", FileAccess.READ)
	delegacia_1C2_C1_C1 = JSON.parse_string(access.get_as_text())
	access.close()
	access = FileAccess.open("res://Text/" + save.selected_locale + "/delegacia_1C2_C1_C2.json", FileAccess.READ)
	delegacia_1C2_C1_C2 = JSON.parse_string(access.get_as_text())
	access.close()
	
	access = FileAccess.open("res://Text/" + save.selected_locale + "/delegacia_1C2_C2.json", FileAccess.READ)
	delegacia_1C2_C2 = JSON.parse_string(access.get_as_text())
	access.close()
	
	access = FileAccess.open("res://Text/" + save.selected_locale + "/delegacia_1C2_C1_2.json", FileAccess.READ)
	delegacia_1C2_C1_2 = JSON.parse_string(access.get_as_text())
	access.close()
	
	access = FileAccess.open("res://Text/" + save.selected_locale + "/delegacia_1C3_2.json", FileAccess.READ)
	delegacia_1C3_2 = JSON.parse_string(access.get_as_text())
	access.close()
	access = FileAccess.open("res://Text/" + save.selected_locale + "/delegacia_1C3_C1.json", FileAccess.READ)
	delegacia_1C3_C1 = JSON.parse_string(access.get_as_text())
	access.close()
	access = FileAccess.open("res://Text/" + save.selected_locale + "/delegacia_1C3_C2.json", FileAccess.READ)
	delegacia_1C3_C2 = JSON.parse_string(access.get_as_text())
	access.close()
	
	access = FileAccess.open("res://Text/" + save.selected_locale + "/delegacia_2.json", FileAccess.READ)
	delegacia_2 = JSON.parse_string(access.get_as_text())
	access.close()
	
	
	access = FileAccess.open("res://Text/" + save.selected_locale + "/delegacia_1C1_C1_2.json", FileAccess.READ)
	delegacia_1C1_C1_2 = JSON.parse_string(access.get_as_text())
	access.close()
	
	
