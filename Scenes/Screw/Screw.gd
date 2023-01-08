extends Area2D
class_name Screw

onready var area_2d = $"."
onready var s_screw_top = $SScrewTop
onready var s_screw_side = $SScrewSide
onready var c_screw = $CScrew
onready var c_screw_2 = $CScrew2

var b_clicked := false
var b_moveable = false
var b_draged = false
var offset := Vector2.ZERO
var velocity = GVariable.velocity

		
func _drag():
	if !b_clicked:
		_first_click()
	offset = global_position-get_global_mouse_position()
	b_moveable = true
	b_draged = true
	
func _drop():
	b_draged = false
	
func _process(delta):
	if b_moveable:
		if b_draged:
			global_position = get_global_mouse_position()+offset
		else:
			global_position.y+=velocity*delta


func _first_click():
	b_clicked=true
	s_screw_top.hide()
	s_screw_side.show()
	c_screw.disabled = true
	c_screw_2.disabled = false


func _on_Screw_area_entered(area):
	if area.is_in_group("Bag"):
		velocity = 0


func _on_Screw_area_exited(area):
	if area.is_in_group("Bag"):
		velocity = GVariable.velocity
