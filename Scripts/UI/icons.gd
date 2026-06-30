extends VBoxContainer

@onready var label1: Label = $HBoxContainer/Label
@onready var label2: Label = $HBoxContainer2/Label
@onready var label3: Label = $HBoxContainer3/Label


func _on_mouse_entered() -> void:
	label1.visible = true
	label2.visible = true
	label3.visible = true

func _on_mouse_exited() -> void:
	label1.visible = false
	label2.visible = false
	label3.visible = false
