extends CanvasLayer

var show_setting = false

func _on_StartGame_pressed():
	var level = get_parent()
	level.start_game()
	$AnimationPlayer.play("Hide")

func _on_Setting_pressed():
	if show_setting:
		show_setting = false
		$AnimationPlayer.play_backwards("ShowSetting")
	else:
		show_setting = true
		$AnimationPlayer.play("ShowSetting")


func _on_HowToPlay_pressed():
	OS.alert("""按方向键或WASD进行小钢球的移动，到达草地将传送到第二关(需收集完所以水晶)，
	第二关到达草地(需收集完所以水晶)将获得游戏的胜利。""", "游戏玩法")


func _on_Quit_pressed():
	get_tree().quit()

func _on_SetBGM_value_changed(value):
	AudioServer.set_bus_volume_db(1, linear2db(value))
	AudioServer.set_bus_mute(1, value < 0.01)


func _on_SetAudio_value_changed(value):
	AudioServer.set_bus_volume_db(2, linear2db(value))
	AudioServer.set_bus_mute(2, value < 0.01)


func _on_FullScreen_toggled(button_pressed):
	OS.window_fullscreen = button_pressed


func _on_ShowFPS_toggled(button_pressed):
	Game.show_fps = button_pressed
