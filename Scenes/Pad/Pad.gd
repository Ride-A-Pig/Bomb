extends Sprite


onready var pad = $"."

var velocity = GVariable.velocity
var b_moveable = false
export var screw_number = 3

func _process(delta):
	if !b_moveable:
		var screws = get_tree().get_nodes_in_group("Screw")
		var screw_count = 0
		for x in screws:
			if x.b_clicked:
				screw_count+=1
		if screw_count == screw_number:
			b_moveable=true
	if b_moveable:
		var tween = create_tween()
		tween.tween_property(pad,"rotation_degrees",-15.0,0.2)
		pad.global_position.y += velocity*delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
