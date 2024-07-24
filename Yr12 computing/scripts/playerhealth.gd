extends Label

var damage = 0
var currenthealth = Player.playerhealth - damage

func _process(_delta):
	#displays playerhealth
	self.text = str(currenthealth)
	
	




