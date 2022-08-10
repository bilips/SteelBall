extends CanvasLayer

func change_scene(path):
	$AnimationPlayer.play("ChangeScene")
	yield($AnimationPlayer, "animation_finished")
	get_tree().change_scene(path)
	$AnimationPlayer.play_backwards("ChangeScene")
