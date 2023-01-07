extends Area2D

onready var area_2d = $"."
onready var s_screw_top = $SScrewTop
onready var c_screw_top = $CScrewTop
onready var s_screw_side = $SScrewSide
onready var c_screw_side = $CScrewSide


var b_mouse_on := false
var b_follow_mouse := false
var b_in_bag := false
var b_clicked := false
var offset := Vector2(0,0)
var velocity = -2000


# Check if the mouse is on the screw.
func _on_Area2D_mouse_entered():
	b_mouse_on = true

func _on_Area2D_mouse_exited():
	b_mouse_on = false


# Check if the mouse left button is pressed or released.
func _input(event):
	# Button Pressed:
	if event.is_action_pressed("Click") and b_mouse_on:
		b_follow_mouse = true
		offset = area_2d.global_position-get_global_mouse_position()
		if not b_clicked:
			s_screw_top.hide()
			c_screw_top.disabled = true
			s_screw_side.show()
			c_screw_side.disabled = false
			var new_parent = get_node("/root/Node2D/Bag")
			get_parent().remove_child(self)
			new_parent.add_child(self)
			print(get_parent().name)
			b_clicked = true
	# Button Released:
	if event.is_action_released("Click"):
		b_follow_mouse = false


# Move the screw if possible
func _process(delta):
	if b_follow_mouse:
		area_2d.global_position = get_global_mouse_position()+offset
	# Move the screw up if it's not in the bag
	if !b_in_bag and !b_follow_mouse and b_clicked:
		area_2d.global_position.y += velocity*delta;




