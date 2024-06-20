extends Label



func _process(_delta):
	#displays health
	self.text = str(Player.playerhealth)
	
	
func _ready():
	#sets health to 5 on game start
	Player.playerhealth = 5



