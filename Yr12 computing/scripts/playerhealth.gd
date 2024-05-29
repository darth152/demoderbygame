extends Label



func _process(_delta):
	#displays score
	self.text = str(Player.playerhealth)
	
	
func _ready():
	#sets score to 0 on game start
	Player.playerhealth = 5



