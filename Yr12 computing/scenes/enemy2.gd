extends KinematicBody2D

var e_speed = 100.0
var player_position
var target_position
var move = false
onready var chase_timer = get_node("chasetimer")
onready var player = get_parent().get_node("Player")

func _physics_process(delta):
	if move == true:
		_move()

func _move():
	player_position = player.position
	
	target_position = (player_position - position).normalized()
	
	if position.distance_to(player_position) > 3:
		move_and_slide(target_position * e_speed)
		look_at(player_position)


func _on_Area2D_area_entered(area):
	if area.is_in_group("player"):
		move = true
		chase_timer.wait_time = 5
		chase_timer.start()


func _on_chasetimer_timeout():
	move = false
