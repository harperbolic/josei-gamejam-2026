extends TextureRect

var screen_width
var screen_height
var x_percent
var y_percent
var start_pos : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_height = get_viewport().get_visible_rect().size.x
	screen_width = get_viewport().get_visible_rect().size.y
	start_pos = position



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	x_percent = get_viewport().get_mouse_position().x - screen_height / 2.0
	y_percent = get_viewport().get_mouse_position().y - screen_width / 2.0
	position.x = start_pos.x + x_percent / 200
	position.y = start_pos.y + y_percent / 200
