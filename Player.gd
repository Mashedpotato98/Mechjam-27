extends KinematicBody2D

var spd = 100
var velocity = Vector2.ZERO

func _process(delta):
	velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	velocity = velocity.normalized()
	move_and_slide(velocity*spd)

func _on_Area2D_area_entered(area):
	Global.p_health -= 1
