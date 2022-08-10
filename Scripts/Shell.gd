extends Area

export(float) var speed = 4.0

func _ready():
	set_process(false)

func shoot():
	set_process(true)

func _process(delta):
	translation.z += speed * delta

func _on_Shell_body_entered(body):
	if body.name == "Player":
		Game.level.get_node("Player").player_die()
	queue_free()

func _on_Shell_area_entered(area):
	queue_free()
