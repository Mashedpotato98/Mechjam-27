extends Area2D

var spd = 300
var dir = 1

func _ready():
	set_as_toplevel(true)

func _process(delta):
	if dir == 1:
		position += (Vector2.RIGHT*spd).rotated(rotation) * delta
	if dir == 2:
		position += (Vector2.LEFT*spd).rotated(rotation) * delta

func _on_Bullet_body_entered(body):
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
