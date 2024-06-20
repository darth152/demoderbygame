extends KinematicBody2D

var angular_speed = PI
var speed = 400.0
var playerhealth = 5
var screen_shake = 0
var shake_mode = 0
var GLOBAL_p_pos = position


func _process(_delta):
	var velocity = Vector2()
	var direction = 0
	
	if playerhealth < 0:
		get_tree().quit()
	
	if Input.is_action_pressed("ui_left") && Input. is_action_pressed("ui_up"):
		direction = -0.5
	
	if Input.is_action_pressed("ui_left") && Input. is_action_pressed("ui_down"):
		direction = 0.5
	
	if Input.is_action_pressed("ui_right") && Input. is_action_pressed("ui_up"):
		direction = 0.5
	
	if Input.is_action_pressed("ui_right") && Input. is_action_pressed("ui_down"):
		direction = -0.5
	
	rotation += angular_speed * direction * _delta
	
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2.UP.rotated(rotation) * speed
	
	if Input.is_action_pressed("ui_down"):
		velocity = Vector2.UP.rotated(rotation) * -speed
	
	if Input.is_action_pressed("ui_up") && Input. is_action_pressed("boost"):
		velocity = Vector2.UP.rotated(rotation) * speed * 2
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * _delta * speed
		
	if move_and_collide(velocity):
		print("Collide!")


func _on_siderails_area_entered(area):
	if area.is_in_group("enemy bumper"):
		print("hit")
		playerhealth += -1
