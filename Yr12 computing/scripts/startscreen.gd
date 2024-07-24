extends Node2D

var track = 1


func _on_playbutton_pressed():
	get_tree().change_scene("res://scenes/play.tscn")
	


func _on_trackleft_pressed():
	track -= 1
	trackpicker()
	Play.trackchange()
	

func _on_trackright_pressed():
	track += 1
	trackpicker()
	Play.trackchange()
	

func trackpicker():
	if track >= 3:
		track = 1
	if track <= 0:
		track = 2
	if track == 1: 
		get_node("trackpicker/Dirttrackicon").visible = false
		get_node("trackpicker/Graveltrackicon").visible = true
	elif track == 2:
		get_node("trackpicker/Dirttrackicon").visible = true
		get_node("trackpicker/Graveltrackicon").visible = false
