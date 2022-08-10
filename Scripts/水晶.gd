extends Area

func _ready():
	set_process(false)

func _on_sj_body_entered(body):
	if body.name == "Player":
		$Get.play()
		yield($Get, "finished")
		Game.crystal += 1
		queue_free()


func _on_CheckPlayer_body_entered(body):
	if body.name == "Player":
		set_process(true)


func _process(delta):
	var player_position = Game.level.get_node("Player").translation
	translation = lerp(translation, player_position, 0.08)
	$OmniLight.light_energy = lerp($OmniLight.light_energy, 0, 0.08)
