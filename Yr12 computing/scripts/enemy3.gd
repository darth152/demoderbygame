extends KinematicBody2D

onready var parent = get_parent() as PathFollow2D

func _ready():
	parent.unit_offset = randf()
	
func _physics_process(_delta):
	if parent is PathFollow2D:
		parent.set_offset(parent.get_offset() + 200 * _delta)
	if Input.is_action_pressed("ui_accept"):
		get_tree().reload_current_scene()
		
