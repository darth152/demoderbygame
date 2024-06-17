extends KinematicBody2D

var angular_speed = PI
var speed = 400.0

func _process(delta):
	var velocity = Vector2()
	var direction = 0
	
	if Input.is_action_pressed("ui_left") && Input. is_action_pressed("ui_up"):
		direction = -1
	
	if Input.is_action_pressed("ui_left") && Input. is_action_pressed("ui_down"):
		direction = 1
	
	if Input.is_action_pressed("ui_right") && Input. is_action_pressed("ui_up"):
		direction = 1
	
	if Input.is_action_pressed("ui_right") && Input. is_action_pressed("ui_down"):
		direction = -1
	
	rotation += angular_speed * direction * delta
	
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2.UP.rotated(rotation) * speed
		
	if Input.is_action_pressed("ui_down"):
		velocity = Vector2.UP.rotated(rotation) * -speed
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * delta * speed
		
	if move_and_collide(velocity):
		print("Collide!")
