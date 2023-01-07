extends Area2D

onready var pad = $"."

var b_mouse_on = false
var b_moveable = false
var velocity = -2000

func _on_Pad_mouse_entered():
	b_mouse_on = true

func _on_Pad_mouse_exited():
	b_mouse_on = false


func _input(event):
	if event.is_action_pressed("Click") and b_mouse_on and get_children().size()==3:
		b_moveable = true
		print("Tween")
		var tween = create_tween()
		tween.tween_property(pad,"rotation_degrees",-15.0,0.2)
	

func _process(delta):
	if b_moveable:
		pad.global_position.y += velocity*delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
