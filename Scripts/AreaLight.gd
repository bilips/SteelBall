extends SpotLight

func _ready():
	set_process(false)

func _on_AreaLight_body_entered(body):
	if body.name == "Player":
		set_process(true)

func _on_AreaLight_body_exited(body):
	if body.name == "Player":
		set_process(false)

func _process(delta):
	var player_position = Game.level.get_node("Player").global_translation
	global_translation.x = lerp(global_translation.x, player_position.x, 0.08)
	global_translation.z = lerp(global_translation.z, player_position.z, 0.08)
