extends Node2D

var track = ("res://scenes/play.tscn")

func _on_playbutton_pressed():
	get_tree().change_scene(track)
