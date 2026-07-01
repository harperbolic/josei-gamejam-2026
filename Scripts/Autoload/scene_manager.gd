extends Node

var SM : String = "Scene Manager: "

var scenes = {
	"intro" : "res://Scenes/intro.tscn",
	"thanks" : "res://Scenes/ending.tscn",
	"splash_screen" : "res://Scenes/splash_screen.tscn",
	"main_menu" : "res://Scenes/main_menu.tscn",
	"map" : "res://Scenes/map.tscn",
	"police_hall" : "res://Scenes/police_hall.tscn",
	"police_room" : "res://Scenes/police_room.tscn",
}

var transition_scene = preload("res://Components/UI/loading_screen.tscn")
signal scene_finished_loading

@onready var scene = load(scenes["splash_screen"]).instantiate()
@onready var old_scene = scene
@onready var current_room = 0

func _ready() -> void:
	print(SM, "Scene 'main_menu' loaded")
	add_child(scene)

func change_scene(scene_str : String) -> void:
	if !scene_str:
		print(SM, "No scene to load passed")
		return
	var transition = transition_scene.instantiate()
	add_child(transition)
	transition.fade_in()
	await transition.fade_finished
	old_scene.queue_free()
	scene = load(scenes[scene_str]).instantiate()
	print(SM, "Scene '", scene_str, "' loaded.")
	add_child.call_deferred(scene)
	old_scene = scene
	transition.fade_out()
