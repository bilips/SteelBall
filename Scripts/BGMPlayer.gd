extends AudioStreamPlayer

func _ready():
	connect("finished", self, "play_again")

func play_again():
	play()
