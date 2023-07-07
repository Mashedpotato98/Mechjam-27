extends Node


var score = 0
var p_health = 5

func _process(delta):
	if p_health <= 0:
		score = 0
		p_health = 5
