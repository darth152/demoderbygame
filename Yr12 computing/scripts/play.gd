extends Node2D

onready var dirt = get_node("tracks/DirtTrack")
onready var gravel = get_node("tracks/GravelTrack")

func trackchange():
	if settings.track == 1: 
		if get_node_or_null("tracks/DirtTrack"):
			dirt.visible = false
		if get_node_or_null("tracks/GravelTrack"):
			gravel.visible = true
	elif settings.track == 2:
		if get_node_or_null("tracks/DirtTrack"):
			dirt.visible = true
		if get_node_or_null("tracks/GravelTrack"):
			gravel.visible = false
	
