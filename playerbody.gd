extends RigidBody2D

var dragging
var drag_start = Vector2()
var drag_end = Vector2()
var launched = false
var try = 2
var dir

func _ready():
	pass

func _input(event):
	if (try != 0):
		if event.is_action_pressed("click") and not dragging and not launched:
			dragging = true
			drag_start = get_global_mouse_position()
		if event.is_action_released("click") and dragging:
			dragging = false
			launched = true
			try -= 1
			drag_end = get_global_mouse_position()
			dir = drag_start - drag_end
			apply_impulse(Vector2(), dir * 5)
			yield(get_tree().create_timer(5.0), "timeout")
			launched = false
		if(try == 0):
			$popup.popup()
			pass
