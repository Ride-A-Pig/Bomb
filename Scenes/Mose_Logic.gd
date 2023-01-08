extends Node2D

var pick = null

func _input(event):
	if event.is_action_pressed("Click"):
		var objects = get_world_2d().direct_space_state.intersect_point(get_global_mouse_position(),32,[],0x7FFFFFFF,true,true)
		if(objects.size()>0):
			if !objects[0].collider.is_in_group("Dragable"):
				return
			pick = objects[0].collider
			pick._drag()
	elif event.is_action_released("Click"):
		if pick!=null:
			pick._drop()
			pick = null


func _on_Button_pressed():
	$AnimationPlayer.play("Start")
	$CanvasLayer.queue_free()
