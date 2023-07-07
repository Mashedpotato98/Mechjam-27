extends Node2D

var bull = preload("res://Bullet.tscn")
var can = true

func _process(delta):
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("shoot") and can == true:
		var bull_ins = bull.instance()
		get_parent().add_child(bull_ins)
		bull_ins.position = $Position2D.global_position
		bull_ins.rotation = rotation
		can = false
		yield(get_tree().create_timer(0.3),"timeout")
		can = true
