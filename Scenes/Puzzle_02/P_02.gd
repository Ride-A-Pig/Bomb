extends Node2D


onready var buttons=[$GridContainer/B_01, $GridContainer/B_02, $GridContainer/B_03, $GridContainer/B_04, $GridContainer/B_05, $GridContainer/B_06, $GridContainer/B_07, $GridContainer/B_08, $GridContainer/B_09]
var buttons_pressed = []
onready var P_02 = get_parent()

func _ready():
	for b in buttons:
		b.connect("pressed",self,"_on_button_pressed")
	
		
func _on_button_pressed():
	if (buttons[0].pressed and buttons[1].pressed and buttons[4].pressed and buttons[5].pressed and buttons[7].pressed) and (!buttons[2].pressed and !buttons[3].pressed and !buttons[6].pressed and !buttons[8].pressed):
		_solved()


func _solved():
	var tween = create_tween()
	tween.tween_property(P_02,"position",Vector2(0,-600),.3)
	yield(tween,"finished")
	P_02.queue_free()
