extends KinematicBody2D

var spd = 40
var velocity = Vector2.ZERO
onready var nav = $NavigationAgent2D

export var path_plr := NodePath()
onready var plr = get_node(path_plr)
onready var tmr = $Timer
onready var tmr_2 = $Timer2

var bull = preload("res://Bullet1.tscn")

func _ready():
	update_pathfinding()
	tmr.connect("timeout",self,"update_pathfinding")

func _physics_process(delta):
	if nav.is_navigation_finished():
		pass
	
	var direction = global_position.direction_to(nav.get_next_location())

	var desired_velo = direction * spd
	var steering =  (desired_velo - velocity) * delta * 4
	velocity += steering
	
	velocity = move_and_slide(velocity)

func update_pathfinding():
	nav.set_target_location(plr.global_position)

func _on_Detection_area_entered(area):
	Global.score += 1
	position.x = rand_range(27,1008)
	position.y = rand_range(7,591)

func _on_Timer2_timeout():
	var bull_ins = bull.instance()
	bull_ins.dir = 1
	get_parent().add_child(bull_ins)
	bull_ins.position = $Position2D.global_position

func _on_Timer3_timeout():
	var bull_ins2 = bull.instance()
	bull_ins2.dir = 2
	get_parent().add_child(bull_ins2)
	bull_ins2.position = $Position2D.global_position
